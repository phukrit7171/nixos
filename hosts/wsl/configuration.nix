{ config, lib, pkgs, ... }:

{
  imports = [
    # เลือกนำเข้าเฉพาะโมดูลที่ใช้งานได้ใน WSL
    ../../modules/core/nix-settings.nix
    ../../modules/core/user.nix
    ../../modules/core/security.nix

    # แอปพลิเคชันและเครื่องมือ Dev
    # ../../modules/apps/packages.nix
    ../../modules/apps/cli.nix
    ../../modules/dev/git.nix
    ../../modules/dev/shell.nix
    ../../modules/dev/containers.nix

    # ห้ามนำเข้า:
    # - core/boot.nix (WSL จัดการ boot เอง)
    # - core/networking.nix (NetworkManager จะตีกับ WSL)
    # - hardware/* (WSL จัดการให้เองหมด)
    # - desktop/* (ใช้ GUI ผ่าน WSLg ของ Windows แทน)
  ];

  # เปิดใช้งาน WSL Module
  wsl.enable = true;
  wsl.defaultUser = "phukrit7171"; # ต้องตรงกับชื่อ User ของคุณ
  wsl.useWindowsDriver = true; # เปิดใช้งานการเรียกใช้ไดรเวอร์ Nvidia/GPU จาก Windows

  # กำหนด Hostname สำหรับ WSL
  networking.hostName = "nixos-wsl";

  # Timezone
  time.timeZone = "Asia/Bangkok";

  system.stateVersion = "25.11";
}
