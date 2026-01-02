# 📱 Installation de Easy Manage sur votre téléphone Android

## 🎯 Méthode simple : Installation directe de l'APK

### Étape 1 : Récupérer l'APK

Une fois la compilation terminée, l'APK sera généré dans :
```
C:\Users\HP\Desktop\EasyManage_Phone\build\app\outputs\flutter-apk\app-release.apk
```

**Taille attendue** : environ 20-30 MB

### Étape 2 : Transférer l'APK sur votre téléphone

#### Option A : Via câble USB
1. Connecter le téléphone à l'ordinateur avec un câble USB
2. Sur le téléphone, choisir "Transfert de fichiers"
3. Copier le fichier `app-release.apk` dans le dossier **Téléchargements** du téléphone
4. Débrancher le téléphone

#### Option B : Via Bluetooth
1. Clic droit sur `app-release.apk` → Envoyer vers → Appareil Bluetooth
2. Sélectionner votre téléphone
3. Accepter le fichier sur le téléphone

#### Option C : Via email/WhatsApp
1. S'envoyer le fichier `app-release.apk` par email ou WhatsApp
2. Ouvrir l'email/message sur le téléphone
3. Télécharger le fichier

### Étape 3 : Autoriser l'installation d'applications inconnues

**⚠️ À FAIRE UNE SEULE FOIS**

Sur votre téléphone Android :
1. Aller dans **Paramètres** → **Sécurité** (ou **Confidentialité**)
2. Chercher **Installer des applications inconnues** (ou **Sources inconnues**)
3. Sélectionner l'application que vous utilisez pour installer (ex: **Fichiers**, **Chrome**, **Mes Fichiers**)
4. Activer **Autoriser depuis cette source**

**Variantes selon les marques :**
- **Samsung** : Paramètres → Biométrie et sécurité → Installer des applis inconnues
- **Xiaomi** : Paramètres → Confidentialité → Sources inconnues
- **Huawei** : Paramètres → Sécurité → Plus de paramètres → Installer des applications inconnues
- **Oppo/Realme** : Paramètres → Mot de passe et sécurité → Confidentialité du système → Sources inconnues

### Étape 4 : Installer l'application

1. Ouvrir l'application **Fichiers** (ou **Mes Fichiers**) sur le téléphone
2. Aller dans **Téléchargements**
3. Appuyer sur **app-release.apk**
4. Une fenêtre s'affiche : "Voulez-vous installer cette application ?"
5. Appuyer sur **Installer**
6. Attendre quelques secondes
7. Appuyer sur **Ouvrir** pour lancer l'application

🎉 **C'est fait ! L'application est installée !**

### Étape 5 : Utiliser l'application

L'icône **EasyManage** apparaîtra dans votre liste d'applications.

## 📝 Mise à jour de l'application

Pour mettre à jour l'application après des modifications :

1. Sur PC : `flutter build apk --release`
2. Transférer le nouveau APK sur le téléphone
3. Installer le nouveau APK (il remplacera l'ancienne version)
4. **Les données sont conservées** ! (ventes, stock, dépenses)

## ⚠️ Important

- **Pas besoin de désinstaller** l'ancienne version avant la mise à jour
- **Vos données sont sauvegardées** dans la base de données locale
- L'application fonctionne **complètement hors ligne**
- Aucune connexion Internet nécessaire

## 🚨 Résolution des problèmes

### "Installation bloquée" ou "Installer quand même"
- C'est normal, Android affiche cet avertissement pour les apps non issues du Play Store
- Appuyer sur **Installer quand même**
- L'application est sûre car vous l'avez compilée vous-même

### "Analyse de l'application en cours..."
- Attendre quelques secondes, c'est Google Play Protect qui scanne
- Appuyer sur **Installer quand même** si demandé

### "Application non installée"
**Solution 1** : Vérifier l'espace de stockage
- Paramètres → Stockage
- Libérer au moins 100 MB

**Solution 2** : Désinstaller l'ancienne version
- Maintenir appuyé sur l'icône EasyManage → Désinstaller
- Réinstaller avec le nouveau APK

### L'application se ferme immédiatement
- Désinstaller complètement l'application
- Réinstaller depuis l'APK
- Si le problème persiste, recompiler en mode debug : `flutter build apk --debug`

## 🔄 Pour les futures mises à jour

### Commandes rapides
```powershell
# Compilation APK release (production)
flutter build apk --release

# Compilation APK debug (avec logs)
flutter build apk --debug

# Compilation APK split par architecture (fichiers plus petits)
flutter build apk --split-per-abi
```

### Localisation des APK
- **Release** : `build\app\outputs\flutter-apk\app-release.apk`
- **Debug** : `build\app\outputs\flutter-apk\app-debug.apk`
- **Split** : `build\app\outputs\flutter-apk\app-armeabi-v7a-release.apk` et autres

## 📊 Différence Debug vs Release

### APK Debug
✅ Contient des outils de débogage  
✅ Logs détaillés  
❌ Plus gros fichier (~40-50 MB)  
❌ Performances moyennes  

### APK Release (Recommandé)
✅ Optimisé pour la performance  
✅ Fichier plus petit (~20-30 MB)  
✅ Application plus rapide  
❌ Pas de logs de débogage  

## 🎁 Fonctionnalités de l'application

### Tableau de bord
- Vue d'ensemble des ventes et dépenses
- Bénéfice net
- Alertes de stock bas

### Ventes
- Enregistrer des ventes
- Historique des ventes
- Statistiques par période

### Stock
- Gérer les produits
- Suivre les quantités
- Alertes de stock minimum

### Dépenses
- Enregistrer les dépenses
- Catégories personnalisables
- Suivi des coûts

### Rapports
- Graphiques de ventes
- Analyse des dépenses
- Export PDF (à venir)

## 📱 Configuration système requise

- Android 5.0 (Lollipop) ou supérieur
- 100 MB d'espace libre
- Aucune connexion Internet nécessaire

---

**Besoin d'aide ?**  
Si vous rencontrez des problèmes, revenez vers moi avec :
- Le message d'erreur exact
- Le modèle de votre téléphone
- La version d'Android
