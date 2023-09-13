FROM pymesh/pymesh

# [Optional] Uncomment this section to install additional vcpkg ports.
# RUN su vscode -c "${VCPKG_ROOT}/vcpkg install <your-port-name-here>"

# [Optional] Uncomment this section to install additional packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends xml2 r-base-core r-cran-reticulate

# switch c++ std lib versions (dirty trick from https://github.com/rstudio/reticulate/issues/841)
RUN rm /usr/lib/x86_64-linux-gnu/libstdc++.so.6 && \
    ln -s /usr/local/lib/python3.6/site-packages/pymesh/lib/libstdc++.so.6 /usr/lib/x86_64-linux-gnu/libstdc++.so.6
