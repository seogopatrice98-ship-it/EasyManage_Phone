# Guide de développement Flutter avec Hot Reload

## Flux de travail typique

### Étape 1 : Démarrer l'application
```powershell
flutter run
```

**Sortie attendue :**
```
Launching lib\main.dart on SM G991B in debug mode...
Running Gradle task 'assembleDebug'...
✓ Built build\app\outputs\flutter-apk\app-debug.apk.
Installing build\app\outputs\flutter-apk\app.apk...
Syncing files to device SM G991B...

Flutter run key commands.
r Hot reload. 🔥
R Hot restart.
h List all available interactive commands.
d Detach (terminate "flutter run" but leave application running).
c Clear the screen
q Quit (terminate the application on the device).

💪 Running with sound null safety 💪

An Observatory debugger and profiler on SM G991B is available at: http://127.0.0.1:xxxxx/
The Flutter DevTools debugger and profiler on SM G991B is available at: http://127.0.0.1:xxxxx/
```

### Étape 2 : Modifier le code

**Exemple** : Changer un texte dans [lib/screens/home_screen.dart](lib/screens/home_screen.dart)

```dart
// AVANT
Text('EasyManage', style: TextStyle(fontSize: 24))

// APRÈS
Text('Mon Application', style: TextStyle(fontSize: 28, color: Colors.blue))
```

### Étape 3 : Voir les changements

1. **Sauvegarder le fichier** (Ctrl+S)
2. **Retourner au terminal** où `flutter run` tourne
3. **Appuyer sur `r`**

**Résultat :**
```
Performing hot reload...
Reloaded 1 of 652 libraries in 842ms.
```

➡️ Le texte change IMMÉDIATEMENT sur votre téléphone ! 🎉

## Quand utiliser quoi ?

### Hot Reload (`r`) - 95% du temps ⚡
Utilisez pour :
- ✅ Modifier l'interface (widgets)
- ✅ Changer les couleurs, tailles, textes
- ✅ Modifier la logique des méthodes
- ✅ Ajuster le layout
- ✅ Corriger les bugs visuels

**Avantages :**
- Ultra rapide (~1 seconde)
- Garde l'état actuel de l'app
- Garde votre position dans la navigation

### Hot Restart (`R`) - Parfois nécessaire 🔄
Utilisez pour :
- ✅ Modifier `main()`
- ✅ Changer les variables globales
- ✅ Modifier les initialisations de State
- ✅ Ajouter de nouveaux packages
- ✅ Changer les enums

**Avantages :**
- Plus rapide qu'un rebuild complet
- Recharge toute l'application

### Full Rebuild - Rarement nécessaire 🏗️
Arrêter (`q`) et relancer (`flutter run`) pour :
- ✅ Modifier `pubspec.yaml`
- ✅ Ajouter des assets
- ✅ Changer la configuration native (Android/iOS)
- ✅ Problèmes de synchronisation

## Raccourcis clavier dans VS Code

Vous pouvez aussi utiliser VS Code au lieu du terminal :

1. **F5** = Démarrer l'application en mode debug
2. **Ctrl+F5** = Démarrer sans debug
3. Pendant l'exécution :
   - L'icône ⚡ dans VS Code = Hot Reload
   - L'icône 🔄 = Hot Restart
   - L'icône ⏹️ = Stop

## Exemple de session de développement

```
09:00 - flutter run                  (Attendre 30-60 secondes)
09:01 - Modifier couleur du bouton   (Sauvegarder + appuyer 'r') → 1 seconde
09:02 - Changer taille du texte      (Sauvegarder + appuyer 'r') → 1 seconde
09:03 - Ajuster padding              (Sauvegarder + appuyer 'r') → 1 seconde
09:05 - Ajouter un nouveau widget    (Sauvegarder + appuyer 'r') → 1 seconde
09:10 - Modifier main()               (Sauvegarder + appuyer 'R') → 2 secondes
09:20 - Ajouter package pubspec.yaml (Appuyer 'q', puis flutter run) → 30 sec
```

## Astuces pro 🎯

### 1. Hot Reload automatique
Dans VS Code, activez l'auto-save :
- Fichier → Préférences → Paramètres
- Chercher "Auto Save"
- Choisir "afterDelay" (500ms)

➡️ Vos changements se rechargent automatiquement !

### 2. Voir les logs en temps réel
```powershell
# Dans un autre terminal
flutter logs
```

### 3. Inspector les widgets
Pendant que l'app tourne :
```
i   Afficher l'inspector des widgets
p   Afficher le rendu visuel des widgets
o   Basculer iOS/Android
```

### 4. Performance
```
P   Afficher le performance overlay
```

## Problèmes courants

### Hot Reload ne fonctionne pas
- Vérifier qu'il n'y a pas d'erreurs de compilation
- Essayer Hot Restart (`R`)
- En dernier recours : `q` puis `flutter run`

### Erreur "Lost connection to device"
- Le téléphone s'est verrouillé → Le déverrouiller
- Le câble s'est déconnecté → Rebrancher
- Vérifier : `flutter devices`

### Changements non visibles
- Sauvegarder le fichier (Ctrl+S)
- Vérifier le bon fichier est modifié
- Essayer `R` au lieu de `r`

## Résumé

🎯 **Processus normal de développement :**

1. `flutter run` une seule fois
2. Modifier le code dans VS Code
3. Sauvegarder (Ctrl+S)
4. Appuyer `r` pour voir les changements
5. Répéter les étapes 2-4 autant de fois que nécessaire
6. `q` pour arrêter quand vous avez fini

**C'est tout ! Pas besoin de copier, recompiler ou réinstaller l'application ! 🚀**

---

## Prêt à commencer ?

Connectez votre téléphone et lancez :
```powershell
flutter run
```

Ensuite, modifiez [lib/main.dart](lib/main.dart) et voyez la magie opérer ! ✨
