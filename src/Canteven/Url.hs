{-# LANGUAGE OverloadedStrings #-}

module Canteven.Url(
    URL,
    (</>)
  ) where

import Data.Monoid ((<>))
import Data.Text (Text, dropWhileEnd)

import qualified Data.Text as T (dropWhile)

type URL = Text

-- |Concatenates a URL and a string of text, and puts a `/` between them. Strips
-- away any `/` characters from the end of the first parameter and the start of
-- the second parameter. Doesn't do any URL-parsing or URL-validation.
(</>) :: URL -> Text -> URL
a </> b = a' <> "/" <> b'
  where
    a' = dropWhileEnd (== '/') a
    b' = T.dropWhile (== '/') b
