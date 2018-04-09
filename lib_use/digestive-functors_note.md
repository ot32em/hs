## Form v m a
type Form v (m :: * -> *) a =
  Text.Digestive.Form.Internal.FormTree m v m a

- v: string-like to display messages/errors
- m: some monad
- a: return type


## Example 1 - The first User Form

> `userForm` :: Monad m => Form Text m User
> userForm = User
>     <$> "name" .: text Nothing
>     <*> "mail" .: check "Not a valid email address" checkEmail (text Nothing)

> `checkEmail` :: Text -> Bool
> checkEmail = isJust . T.find (== '@')



- `text` :: Formlet v m Text
  > text :: (Monad m, Monoid v) => Formlet v m Data.Text.Internal.Text

- `check` :: v -> CheckFn -> Form v m a -> Form v m a
  > check :: (Monad m, Monoid v) => v -> (a -> Bool) -> Form v m a -> Form v m a

- `operator (.:)` :: ^Text -> Form v m a -> Form v m a
  > (.:) :: Monad m => Data.Text.Internal.Text -> Form v m a -> Form v m a


## Example 2 - Simple validate function

> `validateVersion` :: Text -> Result Text Version
>  validateVersion  = 
  maybe (Error "Cannot parse version") // default Value
        Success . mapM (readMaybe . T.unpack) . T.split (== '.')

- `maybe` :: b -> (a -> b) -> Maybe a -> b 
  > maybe defaultValue fn (Just input) = fn input
  > maybe defaultValue fn (Nothing) = defaultValue


- `data Result` v a = `Success` a | `Error` v
  > instance [safe] Monoid v => Monad (Result v)
  > instance [safe] Functor (Result v)
  > instance [safe] (Show v, Show a) => Show (Result v a)
  > instance [safe] Monoid v => Applicative (Result v)

> `validate` :: (a -> Result v b) -> Form v m a -> Form v m b
>  validate  :: (Monad m, Monoid v) =>
                (a -> Result v b) -> Form v m a -> Form v m b


## Example 3 - One of Form w/ Text + [] + Enum, and validation

- `data Category` = Web | Text | Math
       deriving (Bounded, Enum, Eq, Show)

- `data Package` = Package Text Version Category
       deriving (Show)

> `packageForm` :: Monad m => Form Text m Package
> packageForm = Package
>     <$> "name"     .: text Nothing
>     <*> "version"  .: validate validateVersion (text (Just "0.0.0.1"))
>     <*> "category" .: choice categories Nothing
>   where
>     categories = [(x, T.pack (show x)) | x <- [minBound .. maxBound]]


## Exmaple 4 - Compose User Form + Package Form => Release Form

> `data Release` = Release `User` `Package`
>     deriving (Show)

> `releaseForm` :: Monad m => Form Text m Release
> releaseForm = Release
>     <$> "author"  .: userForm
>     <*> "package" .: packageForm

