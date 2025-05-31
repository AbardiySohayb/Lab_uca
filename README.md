# GREFSO Website

Ce dépôt contient le site web du Groupe de Recherche sur les Entreprises Familiales et les Stratégies des Organisations (GREFSO) de l'Université Cadi Ayyad de Marrakech.

## Comment exécuter le projet

### Prérequis

- PHP 7.0 ou supérieur
- MySQL 5.7 ou supérieur
- Serveur web (Apache, Nginx, etc.)

### Installation

1. Clonez ce dépôt dans le répertoire de votre serveur web (par exemple, `htdocs` pour XAMPP, `www` pour WAMP, etc.)
2. Créez une base de données MySQL nommée `grefso_db`
3. Importez le fichier `grefso_db.sql` dans votre base de données
4. Configurez les paramètres de connexion à la base de données dans le fichier `includes/config.php`

### Configuration

Le fichier `includes/config.php` contient les paramètres de configuration du site. Vous devez modifier les paramètres suivants selon votre environnement :

```php
// Database configuration
$db_host = "localhost";
$db_user = "root";
$db_pass = "";
$db_name = "grefso_db";

// Site configuration
$site_url = "";  // Laissez vide pour utiliser des chemins relatifs
```

### Exécution

1. Démarrez votre serveur web et votre serveur MySQL
2. Accédez au site via votre navigateur web à l'adresse : `http://localhost/grefso` (ou l'URL correspondant à votre configuration)

## Structure du projet

- `assets/` : Contient les fichiers CSS, JavaScript et images
- `includes/` : Contient les fichiers PHP inclus dans les pages (header, footer, config, etc.)
- `pages/` : Contient les pages HTML statiques
- `grefso_db.sql` : Script SQL pour créer la base de données

## Problème de CSS résolu

Si vous rencontrez des problèmes avec les styles CSS, voici les solutions mises en place :

1. Pour les pages PHP modernes (index.php, about.php, etc.), le CSS est chargé via le fichier `includes/header.php`
2. Pour les anciennes pages HTML dans le répertoire `pages/colloque2010/`, nous avons créé :
   - Un fichier CSS spécifique : `pages/colloque2010/style.css`
   - Un script JavaScript : `pages/colloque2010/fix-css.js` qui applique les styles
   - Un script commun : `pages/colloque2010/common.js` qui charge le script fix-css.js

### Comment intégrer le CSS dans les anciennes pages HTML

Pour intégrer le CSS dans les anciennes pages HTML, ajoutez simplement la ligne suivante dans la section `<head>` de chaque page :

```html
<script src="common.js"></script>
```

Voir le fichier `pages/colloque2010/example.html` pour un exemple complet.

## Maintenance

Pour ajouter de nouvelles pages :

1. Créez un nouveau fichier PHP dans le répertoire racine
2. Incluez les fichiers header et footer :
   ```php
   <?php
   // Include configuration file
   require_once 'includes/config.php';
   
   // Set page-specific variables
   $page_title = get_page_title('your_page_name');
   $additional_css = [];
   $additional_js = [];
   
   // Include header
   include_once 'includes/header.php';
   ?>
   
   <!-- Your content here -->
   
   <?php
   // Include footer
   include_once 'includes/footer.php';
   ?>
   ```

## Contact

Pour toute question ou problème, veuillez contacter l'administrateur du site à l'adresse : grefso.cadiayyad@gmail.com