# Elm app: tutorial

Learning repo, following: https://www.elm-tutorial.org

A word on navigation:
    - Simple hash (#) navigation works fine
    - For classic navigation (without #), there is a need to have a server that always return index.html for every route, otherwise navigation can only be made from program main entry (Main.elm)
    - No-hash Navigation doesn't work with elm-reactor
    -  No-hash navigation works fine with elm-live