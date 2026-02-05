# AntiMacro Script

## Description

This is an anti-macro script for MTA San Andreas. It detects the use of macros by monitoring weapon switches and firing events. If macro usage is detected, the player is frozen for 3 seconds, and certain controls are disabled to prevent further actions.

## Features

- Monitors weapon switches to specific slots (5 and 6, e.g., M4/AK and Snipers).
- Detects rapid firing or macro behavior.
- Freezes the player and disables controls like weapon switching and firing for a set duration.
- Outputs a chat message to inform the player of the detection.

## Installation

1. Place the `Antimacro` folder in your MTA server's `mods/deathmatch/resources/` directory.
2. Ensure the resource is started in your server's configuration or via the admin panel.

## Configuration

- **FreezeTime**: Set the freeze duration in seconds (default: 3).
- **commands**: List of controls to disable when frozen (default: 'previous_weapon', 'next_weapon', 'aim_weapon', 'fire').

Modify these variables in `c_Antimacro.lua` as needed.

## Usage

The script runs automatically on the client side. No additional setup is required beyond installation.

## Author

rougue_

## Version

1.0