# Guide d'installation de l'émulateur Android

## Étape 1 : Installer Android Studio

1. **Télécharger Android Studio**
   - Aller sur : https://developer.android.com/studio
   - Télécharger la version Windows
   - Exécuter l'installateur

2. **Installation des composants Android**
   - Ouvrir Android Studio
   - Aller dans : `File` → `Settings` (ou `Configure` → `Settings` sur l'écran d'accueil)
   - Naviguer vers : `Appearance & Behavior` → `System Settings` → `Android SDK`
   - Onglet **SDK Platforms** :
     - ✓ Cocher `Android 13.0 (Tiramisu)` ou plus récent
     - ✓ Cocher `Android 12.0 (S)`
   - Onglet **SDK Tools** :
     - ✓ Android SDK Build-Tools
     - ✓ Android SDK Command-line Tools
     - ✓ Android Emulator
     - ✓ Android SDK Platform-Tools
     - ✓ Intel x86 Emulator Accelerator (HAXM installer)
   - Cliquer sur `Apply` puis `OK`

## Étape 2 : Configurer les variables d'environnement

### Trouver le chemin du SDK
Par défaut : `C:\Users\HP\AppData\Local\Android\Sdk`

### Configurer les variables (PowerShell Admin)
```powershell
# Définir ANDROID_HOME
[System.Environment]::SetEnvironmentVariable('ANDROID_HOME', 'C:\Users\HP\AppData\Local\Android\Sdk', 'User')

# Ajouter au PATH
$currentPath = [System.Environment]::GetEnvironmentVariable('Path', 'User')
$newPaths = @(
    'C:\Users\HP\AppData\Local\Android\Sdk\platform-tools',
    'C:\Users\HP\AppData\Local\Android\Sdk\emulator',
    'C:\Users\HP\AppData\Local\Android\Sdk\tools',
    'C:\Users\HP\AppData\Local\Android\Sdk\tools\bin'
)
foreach ($path in $newPaths) {
    if ($currentPath -notlike "*$path*") {
        $currentPath += ";$path"
    }
}
[System.Environment]::SetEnvironmentVariable('Path', $currentPath, 'User')
```

**⚠️ IMPORTANT : Redémarrer VS Code et PowerShell après cette étape !**

## Étape 3 : Créer un émulateur (AVD)

1. **Ouvrir AVD Manager dans Android Studio**
   - Cliquer sur l'icône `Device Manager` (icône de téléphone)
   - Ou : `Tools` → `Device Manager`

2. **Créer un nouvel appareil**
   - Cliquer sur `Create Device`
   - Choisir un appareil : **Pixel 5** (recommandé)
   - Cliquer sur `Next`
   
3. **Sélectionner l'image système**
   - Choisir : **Tiramisu** (Android 13) ou **S** (Android 12)
   - Architecture : **x86_64** (pour émulateur rapide)
   - Télécharger l'image si nécessaire
   - Cliquer sur `Next`
   
4. **Configurer AVD**
   - Nom : `Pixel_5_API_33` (ou autre)
   - Configuration recommandée :
     - RAM : 2048 MB minimum
     - VM heap : 512 MB
     - Internal Storage : 2048 MB
   - Cliquer sur `Finish`

## Étape 4 : Vérifier l'installation

### Redémarrer VS Code puis exécuter :
```powershell
# Vérifier Flutter
flutter doctor -v

# Vérifier ADB
adb --version

# Lister les émulateurs disponibles
emulator -list-avds

# Lister les appareils
flutter devices
```

## Étape 5 : Démarrer l'émulateur

### Option A : Depuis Android Studio
- Ouvrir Device Manager
- Cliquer sur ▶️ à côté de votre émulateur

### Option B : Depuis la ligne de commande
```powershell
# Lister les AVDs
emulator -list-avds

# Démarrer l'émulateur (remplacer Pixel_5_API_33 par votre nom d'AVD)
emulator -avd Pixel_5_API_33
```

## Étape 6 : Lancer l'application Flutter

Une fois l'émulateur démarré :
```powershell
flutter run
```

## Problèmes courants

### L'émulateur est lent
- **Solution 1** : Activer l'accélération matérielle (HAXM pour Intel, WHPX pour AMD)
- **Solution 2** : Allouer plus de RAM dans AVD settings
- **Solution 3** : Utiliser une image système x86_64 au lieu de ARM

### "ANDROID_HOME is not set"
- Vérifier que la variable est bien définie
- Redémarrer VS Code et PowerShell
- Vérifier avec : `echo $env:ANDROID_HOME`

### "adb: command not found"
- Vérifier que platform-tools est dans le PATH
- Redémarrer le terminal
- Vérifier avec : `where.exe adb`

### L'émulateur ne démarre pas
- Vérifier que la virtualisation est activée dans le BIOS
- Installer HAXM : `C:\Users\HP\AppData\Local\Android\Sdk\extras\intel\Hardware_Accelerated_Execution_Manager\intelhaxm-android.exe`
- Désactiver Hyper-V si nécessaire (pour HAXM)

## Alternative : Utiliser un appareil physique

Si l'émulateur ne fonctionne pas :
1. Activer le **Mode développeur** sur votre téléphone Android
2. Activer le **Débogage USB**
3. Connecter le téléphone via USB
4. Exécuter : `flutter devices`
5. Lancer : `flutter run`

## Commandes utiles

```powershell
# Vérifier l'état de Flutter
flutter doctor

# Lister les appareils connectés
flutter devices
adb devices

# Redémarrer ADB
adb kill-server
adb start-server

# Lister les émulateurs
emulator -list-avds

# Informations système
flutter doctor -v
```
