# 🚀 Génération APK avec GitHub Actions

## Votre APK sera compilé automatiquement dans le cloud !

### 📋 Étapes à suivre :

#### 1. Initialiser Git (si ce n'est pas déjà fait)
```powershell
git init
git add .
git commit -m "Initial commit - EasyManage App"
```

#### 2. Créer un repository sur GitHub
1. Aller sur https://github.com/new
2. Nom du repository : **EasyManage_Phone**
3. Visibilité : **Public** (pour GitHub Actions gratuit)
4. Cliquer sur **Create repository**

#### 3. Pousser le code vers GitHub
```powershell
git remote add origin https://github.com/VOTRE_USERNAME/EasyManage_Phone.git
git branch -M main
git push -u origin main
```

#### 4. Activer GitHub Actions
1. Une fois le code poussé, aller sur votre repository GitHub
2. Cliquer sur l'onglet **Actions**
3. Le workflow "Build APK" se lancera automatiquement

#### 5. Télécharger votre APK
1. Attendre 5-10 minutes que la compilation se termine
2. Aller dans **Actions** → Cliquer sur le dernier workflow
3. Télécharger l'artifact **app-release** (fichier APK)
4. Transférer l'APK sur votre téléphone

## ✨ Avantages de cette méthode

✅ Compilation dans le cloud (pas de problème local)  
✅ Environnement propre et stable  
✅ Gratuit avec GitHub Actions  
✅ Compilation automatique à chaque push  
✅ Téléchargement direct de l'APK  

## 🔄 Pour les futures mises à jour

Après modification du code :
```powershell
git add .
git commit -m "Mise à jour de l'application"
git push
```

→ GitHub recompilera automatiquement un nouvel APK !

## 🆘 Besoin d'aide ?

Si vous n'avez pas de compte GitHub :
1. Créer un compte sur https://github.com/signup
2. C'est gratuit et prend 2 minutes
3. Suivre les étapes ci-dessus

---

**La compilation dans le cloud va fonctionner à 100% ! 🎯**
