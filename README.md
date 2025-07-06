# 🚗 Speed Reward Script for FiveM (ox_inventory compatible)

Give your players a reward for fast driving — with full anti-trigger protection, seamless `ox_inventory` integration, and high configurability.

---

## ✅ Features

- 🎁 **Automatic Item Rewards**: Players receive items when driving over a set speed limit.
- ⏱️ **Interval Based**: Reward is granted every X seconds (fully customizable).
- 🚓 **Driver Check**: Only the driver is rewarded, not passengers.
- 🔒 **Server-Side Validation**: All important checks are handled server-side to prevent exploits.
- 🧠 **Anti-Cheat Protection**: Detects and kicks players who try to trigger events manually or bypass mechanics.
- ⚙️ **Fully Configurable**: Speed, item name, quantity, and interval can be easily adjusted.
- 🔄 **Zero Dependencies** (except `ox_inventory`).
- 🪶 **Lightweight & Optimized**: Efficient usage of resources and minimal impact on server performance.

---

## ⚙️ Configuration (`config.lua`)

```lua
Config = {}

Config.MinimumSpeed = 120          -- Minimum speed in km/h to start rewards
Config.RewardItem = 'money'        -- Item to give (must exist in ox_inventory)
Config.Quantity = 1000             -- Amount per reward
Config.Interval = 2000             -- Interval in milliseconds (e.g., 2000ms = 2s)

