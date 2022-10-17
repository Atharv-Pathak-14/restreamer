#!/bin/sh

# Start script for the Restreamer bundle

# First run the import program. It will read the db.dir from the config file in order to
# find an old v1.json. This will be converted to the new db format.

./bin/import
if [ $? -ne 0 ]; then
    exit 1
fi

# Create a hint for the admin interface if there is no index.html

if ! [ -f "${CORE_STORAGE_DISK_DIR}/index.html" ]; then
    cp /core/ui-root/index.html /core/ui-root/index_icon.svg ${CORE_STORAGE_DISK_DIR}
fi

# Now run the core with the possibly converted configuration.

./bin/core
