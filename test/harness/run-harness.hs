module Main where

import Data.List (intercalate)
import System.Exit (ExitCode(..), exitFailure, exitSuccess)
import System.Directory (doesDirectoryExist, doesFileExist, getCurrentDirectory, setCurrentDirectory,
                         getDirectoryContents)
import System.FilePath ((</>))
import System.Process (readProcessWithExitCode, callProcess)
import System.IO (hPutStrLn, hPrint, stderr)
import Control.Monad (filterM, liftM)

testDirs :: [String]
testDirs = ["test/harness","harness","."]

getActualTestDirectory :: [String] -> IO FilePath
getActualTestDirectory test_dirs = do
  validDirs <- filterM (doesFileExist . (</> "run-harness.hs")) test_dirs
  case validDirs of
    []    -> ioError (userError ("run-harness.hs not found in " ++ intercalate " or " test_dirs))
    (d:_) -> return d

subdirectoriesOf :: FilePath -> IO [FilePath]
subdirectoriesOf fp = do
  entries <- getDirectoryContents fp
  filterM (doesDirectoryExist . (fp </>)) (filter (not . isSpecialDir) entries)
  where
    isSpecialDir "." = True
    isSpecialDir ".." = True
    isSpecialDir _ = False

-- from Control.Monad.Extra
findM :: Monad m => (a -> m Bool) -> [a] -> m (Maybe a)
findM _ [] = return Nothing
findM p (x:xs) = do guard <- p x ; if guard then (return $ Just x) else (findM p xs)

main :: IO ExitCode
main = do
  actual_test_dir <- getActualTestDirectory testDirs
  tests <- subdirectoriesOf actual_test_dir
  cdir <- getCurrentDirectory
  hPutStrLn stderr ("Changing to test directory " ++ actual_test_dir ++ " and compiling")
  -- build test executables
  setCurrentDirectory (cdir</>actual_test_dir)
  callProcess "make" ["prepare"]
  -- run harness tests
  hasFailure <- findM (liftM (/= ExitSuccess) . runTest . (cdir</>) . (actual_test_dir</>)) tests
  setCurrentDirectory cdir
  case hasFailure of
    Nothing -> exitSuccess
    Just _failed -> exitFailure
  where
    runTest :: FilePath -> IO ExitCode
    runTest dir = do
      setCurrentDirectory dir
      (exitCode, _outp, _errp) <- readProcessWithExitCode "make" [] ""
      hPutStrLn stderr ("cd " ++ dir ++ " && make: " ++ show exitCode)
--      hPutStrLn stdout _outp
--      hPutStrLn stderr _errp
      return exitCode


