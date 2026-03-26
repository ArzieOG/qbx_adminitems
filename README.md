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

<img width="1199" height="1052" alt="image" src="https://github.com/user-attachments/assets/761761fa-cc20-41ad-9798-ea52f2b4320e" />
<img width="1348" height="621" alt="image" src="https://github.com/user-attachments/assets/918eee23-322b-4c1b-92d8-b4c296bb9b18" />
<img width="1381" height="857" alt="image" src="https://github.com/user-attachments/assets/5890f70f-1ec8-484e-a946-62cba0247344" />
<img width="1160" height="1019" alt="image" src="https://github.com/user-attachments/assets/2177a1c1-08bf-4524-b0c7-8427022bd915" />

📥 Installation

Download or clone the repository

Place the folder in your resources directory

Add the following to your server.cfg:

ensure qbx_adminitems 

Or you can just add to your [qbx] folder

Add your identifier to the server.lua 

Restart your server


❗ Notes

Designed for the qbx framework

Will not spawn weapons with ammo unless configured through ox_inventory

Ensure your items have proper images, labels, and metadata for the best UI experience

