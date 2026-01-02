# Configuration avec un téléphone Android physique

## Étape 1 : Activer le mode développeur sur votre téléphone

### Sur la plupart des téléphones Android :
1. Ouvrir **Paramètres**
2. Aller dans **À propos du téléphone** (ou **Système** → **À propos du téléphone**)
3. Trouver **Numéro de build** (ou **Version MIUI** pour Xiaomi)
4. **Appuyer 7 fois** sur **Numéro de build**
5. Un message apparaît : "Vous êtes maintenant développeur !"

### Variantes selon les marques :
- **Samsung** : Paramètres → À propos du téléphone → Informations sur le logiciel → Numéro de build
- **Xiaomi** : Paramètres → À propos du téléphone → Version MIUI (appuyer 7 fois)
- **Huawei** : Paramètres → Système → À propos du téléphone → Numéro de build
- **Oppo/Realme** : Paramètres → À propos du téléphone → Version (appuyer 7 fois)

## Étape 2 : Activer le débogage USB

1. Retourner dans **Paramètres**
2. Chercher **Options pour les développeurs** (ou **Developer Options**)
   - Peut être dans : Paramètres → Système → Options pour les développeurs
3. Activer **Débogage USB**
4. **Optionnel mais recommandé** : Activer aussi :
   - ✓ Rester activé (l'écran ne se verrouille pas pendant le chargement)
   - ✓ Installation via USB

## Étape 3 : Connecter le téléphone à l'ordinateur

1. Connecter le téléphone avec un **câble USB** (de préférence le câble original)
2. Sur le téléphone, une notification apparaît :
   - Choisir **Transfert de fichiers** (ou **MTP**)
   - Ne pas choisir "Charge uniquement"
3. Une fenêtre popup "Autoriser le débogage USB ?" apparaît :
   - ✓ Cocher **Toujours autoriser depuis cet ordinateur**
   - Appuyer sur **OK** ou **Autoriser**

## Étape 4 : Installer les pilotes USB (Windows uniquement)

Windows installe généralement les pilotes automatiquement. Si ce n'est pas le cas :

### Télécharger les pilotes universels :
- **Google USB Driver** : https://developer.android.com/studio/run/win-usb
- Ou pilotes spécifiques du fabricant :
  - Samsung : https://developer.samsung.com/mobile/android-usb-driver.html
  - Xiaomi : Inclus avec Mi PC Suite
  - Autres : Rechercher "[Marque] USB drivers" sur Google

## Étape 5 : Vérifier la connexion

Exécuter ces commandes dans PowerShell :

```powershell
# Si ADB n'est pas installé, utiliser Flutter
flutter devices
```

**Résultat attendu :**
```
1 connected device:

SM G991B (mobile) • RFCR30ABCDE • android-arm64 • Android 13 (API 33)
```

## Étape 6 : Lancer l'application

```powershell
# Lancer l'application sur le téléphone
flutter run

# Ou spécifier l'appareil si plusieurs sont connectés
flutter run -d <device-id>
```

## Problèmes courants

### Le téléphone n'est pas détecté

**Solution 1 : Vérifier le câble**
- Utiliser le câble original du téléphone
- Certains câbles ne servent que pour la charge

**Solution 2 : Changer le mode USB**
- Sur le téléphone : Notification USB → Transfert de fichiers

**Solution 3 : Révoquer les autorisations**
- Options développeur → Révoquer les autorisations de débogage USB
- Déconnecter et reconnecter le téléphone
- Réautoriser le débogage

**Solution 4 : Vérifier le débogage USB**
- Paramètres → Options développeur
- Désactiver puis réactiver "Débogage USB"

### "device offline" ou "unauthorized"

```powershell
# Sur PC
flutter devices

# Vérifier sur le téléphone qu'une demande d'autorisation est affichée
# Accepter l'autorisation
```

### Le téléphone se déconnecte souvent

Dans **Options développeur**, activer :
- ✓ Rester activé
- Désactiver l'économie d'énergie pour le câble USB

## Avantages d'utiliser un téléphone physique

✅ Pas besoin d'installer Android Studio  
✅ Performances réelles de l'application  
✅ Test des capteurs (GPS, caméra, accéléromètre)  
✅ Test des notifications  
✅ Plus rapide que l'émulateur  
✅ Consomme moins de ressources PC  

## Commandes utiles

```powershell
# Voir les appareils connectés
flutter devices

# Lancer sur un appareil spécifique
flutter run -d <device-id>

# Recharger l'application (hot reload)
# Appuyer sur 'r' dans le terminal pendant que l'app tourne

# Recharger complètement (hot restart)
# Appuyer sur 'R' dans le terminal

# Arrêter l'application
# Appuyer sur 'q' dans le terminal

# Voir les logs
flutter logs
```

## Prêt à tester !

Une fois votre téléphone connecté et détecté, vous êtes prêt à développer ! 🚀
