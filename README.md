# Arzie QBX Admin Item Spawner

A lightweight and modern Admin Item Spawner built for qbx, designed to let admins quickly search for and spawn any item from ox_inventory using a basic UI.

Perfect for testing, development, or administrative item distribution.

✨ Features

🔍 Live search – instantly filters items as you type

🖼️ Item images + labels pulled directly from ox_inventory

📦 Lists all registered items automatically

🔐 Admin-only command (Set admins in the server.lua)

⚡ Fast & lightweight, optimized for qbx servers

🔧 No item definitions needed — reads your existing ox_inventory items

📦 Dependencies

This script requires:

qbx framework https://github.com/Qbox-project/qbx_core

ox_inventory 

ox_lib (Optional)

📝 Command

Default command:

/adminitem

This can be changed

The command opens the Admin Item Menu, where admins can search and spawn items instantly.

📸 Preview

<img width="1228" height="992" alt="image" src="https://github.com/user-attachments/assets/cb9b48ea-f65f-4028-a536-2d806a709e4e" />
<img width="1174" height="575" alt="image" src="https://github.com/user-attachments/assets/43604435-34fe-4168-aca2-de32a267f9a5" />
<img width="1161" height="580" alt="image" src="https://github.com/user-attachments/assets/fd9c9d8f-89a6-4a62-9021-fbbf2fed58d1" />

📥 Installation

Download or clone the repository

Place the folder in your resources directory

Add the following to your server.cfg:

ensure qbx_adminitems 

Or you can just add to your [qbx] folder


Adjust the config (optional)

Restart your server


❗ Notes

Designed for the qbx framework

Will not spawn weapons with ammo unless configured through ox_inventory

Ensure your items have proper images, labels, and metadata for the best UI experience

