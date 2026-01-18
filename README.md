# Live555 Overlay Port

[![Check Live555 Update](https://github.com/bcpearce/Live555-Overlay-Port/actions/workflows/check-updates.yml/badge.svg)](https://github.com/bcpearce/Live555-Overlay-Port/actions/workflows/check-updates.yml)

Provides an overlay port for Live555 which is kept up to date with the latest branch.

It is recommended to add this as a submodule to the repository consuming it and add the overlay port to `vcpkg-configuration.json`. 

```json
// vcpkg-configuration.json
{
  "overlay-ports": [
    "./Live555-Overlay-Port/ports"
  ]
}
```

The targets can then be used in cmake

```cmake
find_package(Live555 CONFIG REQUIRED)

add_executable(Dummy main.cpp)
target_link_libraries(
  Dummy PUBLIC Live555::groupsock Live555::liveMedia Live555::UsageEnvironment
               Live555::BasicUsageEnvironment)
```

## Manual Updates

If this repository is not up to date, the command

`scripts/download.sh sha | tr -d '\n' > ports/live555/live555-sha512`

can update the SHA512 for the repo. 
