import Network.Wai.Handler.Warp
import System.Environment
import Web.Simple

app :: (Application -> IO ()) -> IO ()
app runner = do
    runner $ controllerApp () $ do
      routeTop $ respond $
        ok "text/plain" "Hello, world!"

main :: IO ()
main = do
    env <- getEnvironment
    let port = maybe 8080 read $ lookup "PORT" env
    app (run port)
