# My multi-host NixOS configuration

(laptop-thinkpad, laptop-asus, wsl, vm)

This repository contains my personal NixOS flake used to manage multiple machines, each optimized for a different workflow and purpose.

---

## Laptop-asus

![Preview Screenshot](/assets/laptop-asus.png)

**Role:** Heavy-duty workstation / main machine

- **GPU:** NVIDIA
- **Desktop:** GNOME + PaperWM
- **Focus:** Performance and feature-rich desktop experience

This host is designed for **heavy workloads**, including:

- Large desktop applications
- IDEs and development tools
- Large Language Models (LLMs)
- Multiple systemd services running in parallel
- Incus-based virtual machines (VMs)
- Long-running and resource-intensive tasks

GNOME provides a stable and polished desktop environment, while PaperWM adds a structured, tiling-style workflow suitable for complex multitasking.

---

## Laptop-thinkpad

![Preview Screenshot](/assets/laptop-thinkpad.png)

**Role:** Productivity & work-from-home machine

- **Window Manager:** MangoWM
- **Bar:** Waybar
- **Focus:** Workflow efficiency and minimalism

This host is optimized for:

- Keyboard-driven productivity
- Lightweight and fast system
- Remote work and daily development tasks
- Clean and distraction-free workflow

MangoWM + Waybar provides a minimal, responsive setup that prioritizes **speed, simplicity, and focus**, making it ideal for long working sessions without unnecessary overhead.

---

Each host shares the same NixOS foundation while remaining specialized for its intended use case.
