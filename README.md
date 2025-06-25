# docker-magento

## Overview

> [!IMPORTANT]
> This project is limited to be used only with **Magento Open Source (Community Edition)** version 2.4.8. It cannot be used with **Adobe Commerce** and is not recommended for production environments. It is intended for use in **local environments only**.

> Before installing the project, make sure that you have set the PUBLIC_KEY and PRIVATE_KEY in the auth.json file.
> The auth.json file can be found in the config folder. You can rename the file auth.json.example and insert the PUBLIC_KEY and PRIVATE_KEY in the username and password fields.
```
{
    "http-basic": {
        "repo.magento.com": {
            "username": "<YOUR_PUBLIC_KEY>",
            "password": "<YOUR_PRIVATE_KEY>"
        }
    }
}
```
> If you do not have a PUBLIC_KEY and PRIVATE_KEY, you can obtain them by following the official instructions here - [Get your authentication keys](https://experienceleague.adobe.com/en/docs/commerce-operations/installation-guide/prerequisites/authentication-keys).

## Installation

To install the project, run:
```
make install
```
   
## Usage

To start the project, run:
```
make start
```

To stop the project, run:
```
make stop
```
