docker run -e "ACCEPT_EULA=Y" `
           -e "MSSQL_SA_PASSWORD=$DB_PWD" `
           -p 1433:1433 `
           -v ./data:/var/opt/mssql/data `
           -v ./log:/var/opt/mssql/log `
           -v ./secrets:/var/opt/mssql/secrets `
           -d `
           --user root `
           --name sqlserver2019 `
           mcr.microsoft.com/mssql/server:2019-latest
