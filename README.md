# TWRP Device Tree — Xiaomi citrine (Redmi Note 14 5G)

## Especificaciones del dispositivo

| Característica | Especificación |
|---|---|
| **Codename** | citrine |
| **Modelo** | Redmi Note 14 5G |
| **SoC** | MediaTek Dimensity 7025 Ultra / MT6855 |
| **Arquitectura** | ARM64 (arm64-v8a) |
| **Android** | 14 (OS2.0.207.0.VOQMIXM) |
| **Partición** | A/B (Virtual A/B) |
| **Recovery** | Recovery as Boot |
| **Fingerprint** | Redmi/citrine_global/citrine:14/SP1A.210812.016 |

---

## ⚠️ Paso obligatorio antes de compilar

Necesitas agregar el **kernel prebuilt** extraído de tu dispositivo:

```bash
# En Termux con root:
su -c "dd if=/dev/block/by-name/boot of=/sdcard/boot.img"

# Luego en PC, extrae el kernel del boot.img:
pip install extract-dtb
python3 -m unpackbootimg -i boot.img
# El archivo 'kernel' resultante va en:  prebuilt/kernel

# Para el DTB real:
su -c "dd if=/dev/block/by-name/vendor_boot of=/sdcard/vendor_boot.img"
# Extrae el DTB y reemplaza prebuilt/dtb.img
```

---

## Cómo compilar

### 1. Instalar dependencias
```bash
sudo apt update && sudo apt install -y git-core gnupg flex bison \
  build-essential zip curl zlib1g-dev gcc-multilib g++-multilib \
  libc6-dev-i386 libncurses5-dev x11proto-core-dev libx11-dev \
  lib32z-dev libgl1-mesa-dev libxml2-utils xsltproc unzip \
  python3 python-is-python3 ccache
```

### 2. Instalar repo
```bash
mkdir ~/bin && curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo && export PATH=~/bin:$PATH
```

### 3. Sincronizar TWRP
```bash
mkdir ~/twrp && cd ~/twrp
repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
repo sync -j$(nproc) --force-sync
```

### 4. Colocar el device tree
```bash
# Copia esta carpeta a:
cp -r twrp_citrine/ ~/twrp/device/xiaomi/citrine/
```

### 5. Compilar
```bash
cd ~/twrp
. build/envsetup.sh
lunch twrp_citrine-eng
mka recoveryimage -j$(nproc)
```

### 6. Output
```
out/target/product/citrine/recovery.img
```

---

## Flashear

```bash
# Desde fastboot:
adb reboot fastboot
fastboot flash boot recovery.img
fastboot reboot
```

### Entrar a TWRP:
Apaga el teléfono → mantén **Volumen Arriba + Power**

---

## Notas
- Usa **TWRP 12.1** (Android 12 manifest) aunque el dispositivo tenga Android 14
- El cifrado **FBE** está incluido en este tree
- Si el touch no responde, prueba agregar `TW_INPUT_BLACKLIST` en BoardConfig.mk
- El DTB incluido es del beryl (mismo SoC MT6855) — **reemplázalo con el tuyo**
