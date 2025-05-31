-- Création de la base de données
CREATE DATABASE IF NOT EXISTS lire_rmd_db;
USE lire_rmd_db;

-- Table des utilisateurs (admin uniquement)
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insertion de l'utilisateur admin par défaut (mot de passe: admin123)
INSERT INTO users (email, password, name) VALUES 
('admin@admin.com', 'admin123', 'Administrateur');

-- Table pour le contenu de la page d'accueil
CREATE TABLE IF NOT EXISTS home_content (
    id INT AUTO_INCREMENT PRIMARY KEY,
    section_name VARCHAR(50) NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insertion du contenu initial
INSERT INTO home_content (section_name, title, content) VALUES
('director_word', 'Mot du Directeur', '<p>Le Groupe de Recherche sur les Entreprises Familiales et les Stratégies des Organisations (GREFSO) a été créé en 2007. Il constitue l''une des structures de recherche en gestion au sein de la Faculté des Sciences Juridiques, Economiques et Sociales de l''Université Cadi Ayyad.</p><p>Le GREFSO se compose d''enseignants-chercheurs et de doctorants des disciplines du management. Il a pour vocation de :</p><ul><li>Développer des approches méthodologiques et des cadres conceptuels pour l''étude des comportements stratégiques des entreprises marocaines, notamment PME et PMI, de type familiales, en intégrant l''ensemble des paramètres internes et externes aux organisations.</li><li>Stimuler le développement de travaux empiriques sous forme de colloques, séminaires, recherches qualitatives, quantitatives ou de monographies sur les pratiques stratégiques des entreprises marocaines en général et celles des PME-PMI et des entreprises familiales en particulier.</li><li>Contribuer au développement des recherches empiriques et conceptuelles sur le management des entreprises marocaines en général et celles de la région du Haouz en particulier en mettant en place une base de données sur les pratiques stratégiques de ces firmes.</li></ul>');

-- Table pour les événements
CREATE TABLE IF NOT EXISTS events (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    event_date DATE NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insertion des événements initiaux
INSERT INTO events (title, description, event_date) VALUES
('Séminaire de recherche', 'Thème: Stratégies des PME marocaines', '2023-06-15'),
('Atelier méthodologique', 'Méthodes de recherche qualitative', '2023-06-22');

-- Table pour les actualités
CREATE TABLE IF NOT EXISTS news (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    news_date DATE NOT NULL,
    is_new BOOLEAN DEFAULT TRUE,
    link VARCHAR(255),
    link_text VARCHAR(100),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insertion des actualités initiales
INSERT INTO news (title, content, news_date, link, link_text) VALUES
('Journées Doctoriales en Management', 'Les groupes de recherche en Gestion de l''Université Cadi Ayyad organisent en collaboration avec l''AMDEM les Journées Doctoriales en Management à Marrakech, avec le soutien du CEDoc.', '2023-05-30', 'jdm.php', 'Plus d''informations'),
('Colloque International sur la Construction de la Croissance des PME', 'Le GREFSO et Euromed Management Marrakech ont organisé un colloque international sur le thème "Construction de la croissance des PME".', '2010-03-11', 'colloque2010.php', 'Accéder au site du colloque'),
('Association Marocaine des Doctorants en Management', 'La tenue de l''assemblée générale constitutive de l''Association Marocaine des Doctorants en Management (AMDEM), a donné naissance au bureau exécutif.', '2023-04-15', 'actualites.php', 'Plus d''informations');

-- Table pour les appels à communication
CREATE TABLE IF NOT EXISTS calls (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    is_new BOOLEAN DEFAULT TRUE,
    link VARCHAR(255),
    link_text VARCHAR(100),
    icon VARCHAR(50) DEFAULT 'fas fa-download',
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insertion des appels à communication initiaux
INSERT INTO calls (title, description, link, link_text, icon) VALUES
('Atelier méthodologique sous-régional', 'Sciences sociales en Afrique, session 2023 pour l''Afrique du Nord', 'documents/appel-atelier-methodologique.pdf', 'Appel à candidatures', 'fas fa-download'),
('Workshop: Gestion des connaissances et innovation', 'État et perspectives - INPT de Rabat, 11 Octobre 2023', 'http://www.ciems.ma/workshop/gci.html', 'Plus d''informations', 'fas fa-external-link-alt');

-- Table pour les liens utiles
CREATE TABLE IF NOT EXISTS useful_links (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    url VARCHAR(255) NOT NULL,
    icon VARCHAR(50) DEFAULT 'fas fa-link',
    is_active BOOLEAN DEFAULT TRUE,
    display_order INT DEFAULT 0
);

-- Insertion des liens utiles initiaux
INSERT INTO useful_links (title, url, icon, display_order) VALUES
('www.ucam.ac.ma', 'http://www.ucam.ac.ma', 'fas fa-globe', 1),
('www.ucam.ac.ma/fsjes', 'http://www.ucam.ac.ma/fsjes', 'fas fa-university', 2),
('www.enssup.gov.ma', 'http://www.enssup.gov.ma', 'fas fa-graduation-cap', 3),
('www.encgt.ma', 'http://www.encgt.ma', 'fas fa-school', 4);

-- Table pour les paramètres du site
CREATE TABLE IF NOT EXISTS site_settings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    setting_name VARCHAR(50) NOT NULL UNIQUE,
    setting_value TEXT NOT NULL,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insertion des paramètres initiaux
INSERT INTO site_settings (setting_name, setting_value) VALUES
('site_name', 'LIRE-RMD'),
('site_description', 'Groupe de Recherche sur les Entreprises Familiales et les Stratégies des Organisations'),
('site_university', 'Université Cadi Ayyad - Marrakech'),
('site_email', 'contact@grefso.ma'),
('site_phone', '+212 5 24 30 48 50'),
('hero_image', 'https://images.unsplash.com/photo-1454165804606-3c6e0d1d5ab9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80');

-- Table pour l'équipe
CREATE TABLE IF NOT EXISTS team_members (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    title VARCHAR(100) NOT NULL,
    bio TEXT,
    photo VARCHAR(255) DEFAULT 'assets/img/default-profile.jpg',
    email VARCHAR(100),
    is_active BOOLEAN DEFAULT TRUE,
    display_order INT DEFAULT 0
);

-- Insertion des membres de l'équipe initiaux
INSERT INTO team_members (name, title, bio, display_order) VALUES
('Dr. Mohammed Alami', 'Directeur du LIRE-RMD', 'Professeur de Management Stratégique avec plus de 20 ans d''expérience dans la recherche sur les entreprises familiales.', 1),
('Dr. Fatima Zahra Benali', 'Chercheur Senior', 'Spécialiste en gouvernance des entreprises familiales et transmission intergénérationnelle.', 2),
('Dr. Karim Mansouri', 'Chercheur Associé', 'Expert en stratégies d''internationalisation des PME marocaines.', 3),
('Dr. Samira El Fassi', 'Chercheur Associé', 'Spécialiste en entrepreneuriat et innovation dans les PME.', 4);

-- Table pour les publications
CREATE TABLE IF NOT EXISTS publications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    authors VARCHAR(255) NOT NULL,
    publication_date DATE NOT NULL,
    journal VARCHAR(255),
    abstract TEXT,
    link VARCHAR(255),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insertion des publications initiales
INSERT INTO publications (title, authors, publication_date, journal, abstract, link) VALUES
('Stratégies de croissance des PME familiales marocaines', 'Alami M., Benali F.Z.', '2022-05-15', 'Revue Marocaine de Gestion', 'Cette étude examine les stratégies de croissance adoptées par les PME familiales au Maroc et leur impact sur la performance à long terme.', 'https://example.com/publication1'),
('Gouvernance et performance des entreprises familiales', 'Mansouri K., El Fassi S.', '2021-11-10', 'Journal of Family Business Management', 'Cette recherche analyse la relation entre les mécanismes de gouvernance et la performance financière des entreprises familiales marocaines.', 'https://example.com/publication2');

-- Table pour les contacts
CREATE TABLE IF NOT EXISTS contact_messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    is_read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table pour les pages de contenu
CREATE TABLE IF NOT EXISTS page_content (
    id INT AUTO_INCREMENT PRIMARY KEY,
    page_name VARCHAR(50) NOT NULL,
    section_name VARCHAR(50) NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insertion du contenu initial pour les pages
INSERT INTO page_content (page_name, section_name, title, content) VALUES
('about', 'history', 'Notre histoire', '<p>Le Groupe de Recherche sur les Entreprises Familiales et les Stratégies des Organisations (GREFSO) a été créé en 2007 au sein de la Faculté des Sciences Juridiques, Économiques et Sociales de l''Université Cadi Ayyad de Marrakech.</p><p>Depuis sa création, le GREFSO s''est imposé comme un acteur majeur de la recherche en gestion au Maroc, en se spécialisant dans l''étude des entreprises familiales et des PME marocaines.</p>'),
('about', 'mission', 'Notre mission', '<p>Le GREFSO a pour mission principale de :</p><ul><li>Développer des approches méthodologiques et des cadres conceptuels pour l''étude des comportements stratégiques des entreprises marocaines.</li><li>Stimuler le développement de travaux empiriques sur les pratiques stratégiques des entreprises marocaines.</li><li>Contribuer au développement des recherches empiriques et conceptuelles sur le management des entreprises marocaines.</li><li>Former la nouvelle génération de chercheurs en management au Maroc.</li></ul>'),
('about', 'values', 'Nos valeurs', '<div class="grid grid-cols-1 md:grid-cols-2 gap-4"><div class="p-4 bg-gray-50 rounded-lg"><h4 class="font-bold text-primary-600 mb-2">Excellence académique</h4><p class="text-gray-700">Nous nous engageons à maintenir les plus hauts standards de rigueur scientifique dans toutes nos recherches.</p></div><div class="p-4 bg-gray-50 rounded-lg"><h4 class="font-bold text-primary-600 mb-2">Innovation</h4><p class="text-gray-700">Nous encourageons les approches novatrices et créatives pour résoudre les problèmes complexes du management.</p></div><div class="p-4 bg-gray-50 rounded-lg"><h4 class="font-bold text-primary-600 mb-2">Collaboration</h4><p class="text-gray-700">Nous croyons en la puissance du travail d''équipe et des partenariats nationaux et internationaux.</p></div><div class="p-4 bg-gray-50 rounded-lg"><h4 class="font-bold text-primary-600 mb-2">Impact sociétal</h4><p class="text-gray-700">Nous visons à produire des recherches qui ont un impact positif sur les entreprises et la société marocaine.</p></div></div>'),
('activities', 'research', 'Nos axes de recherche', '<div class="space-y-6"><div class="p-4 bg-gray-50 rounded-lg"><h3 class="text-xl font-semibold mb-2 text-primary-600">Entreprises familiales</h3><p class="text-gray-700 mb-3">Étude des spécificités des entreprises familiales marocaines, leur gouvernance, leur transmission et leur pérennité.</p><ul class="list-disc pl-6 text-gray-700"><li>Gouvernance des entreprises familiales</li><li>Succession et transmission</li><li>Professionnalisation des entreprises familiales</li></ul></div><div class="p-4 bg-gray-50 rounded-lg"><h3 class="text-xl font-semibold mb-2 text-primary-600">PME et entrepreneuriat</h3><p class="text-gray-700 mb-3">Analyse des stratégies de croissance des PME marocaines et des dynamiques entrepreneuriales.</p><ul class="list-disc pl-6 text-gray-700"><li>Stratégies de croissance des PME</li><li>Internationalisation des PME</li><li>Entrepreneuriat et innovation</li></ul></div><div class="p-4 bg-gray-50 rounded-lg"><h3 class="text-xl font-semibold mb-2 text-primary-600">Management stratégique</h3><p class="text-gray-700 mb-3">Étude des processus stratégiques et des pratiques managériales dans le contexte marocain.</p><ul class="list-disc pl-6 text-gray-700"><li>Stratégies d''adaptation aux changements</li><li>Management de l''innovation</li><li>Responsabilité sociale des entreprises</li></ul></div></div>');

-- Table pour les médias
CREATE TABLE IF NOT EXISTS media (
    id INT AUTO_INCREMENT PRIMARY KEY,
    file_name VARCHAR(255) NOT NULL,
    file_path VARCHAR(255) NOT NULL,
    file_type VARCHAR(50) NOT NULL,
    file_size INT NOT NULL,
    title VARCHAR(255),
    description TEXT,
    uploaded_by INT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (uploaded_by) REFERENCES users(id) ON DELETE SET NULL
);

-- Table pour les catégories de publications
CREATE TABLE IF NOT EXISTS publication_categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    display_order INT DEFAULT 0
);

-- Insertion des catégories de publications initiales
INSERT INTO publication_categories (name, description, display_order) VALUES
('Articles scientifiques', 'Articles publiés dans des revues scientifiques à comité de lecture', 1),
('Ouvrages', 'Livres et chapitres d''ouvrages', 2),
('Communications', 'Communications présentées lors de conférences et colloques', 3),
('Rapports de recherche', 'Rapports et études réalisés par le GREFSO', 4);

-- Table pour associer les publications aux catégories
CREATE TABLE IF NOT EXISTS publication_category_relations (
    publication_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (publication_id, category_id),
    FOREIGN KEY (publication_id) REFERENCES publications(id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES publication_categories(id) ON DELETE CASCADE
);

-- Table pour les partenaires
CREATE TABLE IF NOT EXISTS partners (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    logo VARCHAR(255),
    website VARCHAR(255),
    description TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    display_order INT DEFAULT 0
);

-- Insertion des partenaires initiaux
INSERT INTO partners (name, website, description, display_order) VALUES
('Université Cadi Ayyad', 'http://www.uca.ma', 'Université publique marocaine basée à Marrakech', 1),
('Confédération Générale des Entreprises du Maroc (CGEM)', 'http://www.cgem.ma', 'Organisation patronale marocaine', 2),
('Association des Femmes Chefs d''Entreprises du Maroc (AFEM)', 'http://www.afem.ma', 'Association professionnelle pour les femmes entrepreneures', 3);

-- Table pour les témoignages
CREATE TABLE IF NOT EXISTS testimonials (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(100),
    organization VARCHAR(100),
    content TEXT NOT NULL,
    photo VARCHAR(255),
    is_active BOOLEAN DEFAULT TRUE,
    display_order INT DEFAULT 0
);

-- Insertion des témoignages initiaux
INSERT INTO testimonials (name, position, organization, content, display_order) VALUES
('Ahmed Benali', 'Directeur Général', 'PME Maroc', 'La collaboration avec le GREFSO nous a permis de mieux comprendre les enjeux de la transmission de notre entreprise familiale.', 1),
('Fatima Zahra Alaoui', 'Doctorante', 'Université Cadi Ayyad', 'L''encadrement et le soutien du GREFSO ont été déterminants dans la réussite de ma thèse de doctorat.', 2);

-- Table pour les newsletters
CREATE TABLE IF NOT EXISTS newsletters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    name VARCHAR(100),
    is_active BOOLEAN DEFAULT TRUE,
    subscription_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table pour les statistiques du site
CREATE TABLE IF NOT EXISTS site_statistics (
    id INT AUTO_INCREMENT PRIMARY KEY,
    page_views INT DEFAULT 0,
    unique_visitors INT DEFAULT 0,
    total_publications INT DEFAULT 0,
    total_events INT DEFAULT 0,
    total_members INT DEFAULT 0,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insertion des statistiques initiales
INSERT INTO site_statistics (page_views, unique_visitors, total_publications, total_events, total_members) VALUES
(0, 0, 2, 2, 4);

-- Tables pour la page À propos (About)
CREATE TABLE IF NOT EXISTS about_sections (
    id INT AUTO_INCREMENT PRIMARY KEY,
    section_key VARCHAR(50) NOT NULL UNIQUE,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    icon VARCHAR(50) DEFAULT 'fas fa-info-circle',
    display_order INT DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table pour les valeurs de l'entreprise (partie de la page à propos)
CREATE TABLE IF NOT EXISTS about_values (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    icon VARCHAR(50) DEFAULT 'fas fa-star',
    color VARCHAR(20) DEFAULT 'primary-600',
    display_order INT DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table pour les axes de recherche
CREATE TABLE IF NOT EXISTS research_areas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    detailed_description TEXT,
    icon VARCHAR(50) DEFAULT 'fas fa-search',
    color VARCHAR(20) DEFAULT 'primary-600',
    research_points JSON, -- Pour stocker les points de recherche
    display_order INT DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table mise à jour pour l'équipe (déjà existante mais on ajoute des champs)
ALTER TABLE team_members 
ADD COLUMN IF NOT EXISTS category ENUM('direction', 'researcher', 'phd_student') DEFAULT 'researcher',
ADD COLUMN IF NOT EXISTS specialization VARCHAR(255),
ADD COLUMN IF NOT EXISTS linkedin VARCHAR(255),
ADD COLUMN IF NOT EXISTS orcid VARCHAR(100),
ADD COLUMN IF NOT EXISTS research_interests TEXT,
ADD COLUMN IF NOT EXISTS phone VARCHAR(20);

-- Table pour les types d'activités
CREATE TABLE IF NOT EXISTS activity_types (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    icon VARCHAR(50) DEFAULT 'fas fa-calendar',
    color VARCHAR(20) DEFAULT 'primary-600',
    is_active BOOLEAN DEFAULT TRUE,
    display_order INT DEFAULT 0
);

-- Table pour les activités
CREATE TABLE IF NOT EXISTS activities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    content TEXT, -- Contenu détaillé
    start_date DATE,
    end_date DATE,
    location VARCHAR(255),
    organizer VARCHAR(255),
    target_audience VARCHAR(255),
    registration_required BOOLEAN DEFAULT FALSE,
    registration_link VARCHAR(255),
    external_link VARCHAR(255),
    image VARCHAR(255),
    status ENUM('upcoming', 'ongoing', 'completed', 'cancelled') DEFAULT 'upcoming',
    is_featured BOOLEAN DEFAULT FALSE,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (type_id) REFERENCES activity_types(id) ON DELETE CASCADE
);

-- Table pour les partenariats liés aux activités
CREATE TABLE IF NOT EXISTS activity_partnerships (
    id INT AUTO_INCREMENT PRIMARY KEY,
    activity_id INT NOT NULL,
    partner_id INT NOT NULL,
    partnership_type ENUM('organizer', 'sponsor', 'supporter', 'participant') DEFAULT 'supporter',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (activity_id) REFERENCES activities(id) ON DELETE CASCADE,
    FOREIGN KEY (partner_id) REFERENCES partners(id) ON DELETE CASCADE
);

-- Insertion des données pour la page À propos
INSERT INTO about_sections (section_key, title, content, icon, display_order) VALUES
('history', 'Notre histoire', 
'<p>Le Groupe de Recherche sur les Entreprises Familiales et les Stratégies des Organisations (GREFSO) a été créé en 2007 au sein de la Faculté des Sciences Juridiques, Économiques et Sociales de l''Université Cadi Ayyad de Marrakech.</p>
<p>Depuis sa création, le GREFSO s''est imposé comme un acteur majeur de la recherche en gestion au Maroc, en se spécialisant dans l''étude des entreprises familiales et des PME marocaines.</p>', 
'fas fa-history', 1),

('mission', 'Notre mission', 
'<p>Le GREFSO a pour mission principale de :</p>
<ul class="list-disc pl-6 mb-4 space-y-2 text-gray-700">
    <li>Développer des approches méthodologiques et des cadres conceptuels pour l''étude des comportements stratégiques des entreprises marocaines.</li>
    <li>Stimuler le développement de travaux empiriques sur les pratiques stratégiques des entreprises marocaines.</li>
    <li>Contribuer au développement des recherches empiriques et conceptuelles sur le management des entreprises marocaines.</li>
    <li>Former la nouvelle génération de chercheurs en management au Maroc.</li>
</ul>', 
'fas fa-bullseye', 2),

('team_intro', 'Notre équipe', 
'<p>Le GREFSO est composé d''enseignants-chercheurs permanents, de chercheurs associés et de doctorants, tous spécialisés dans différents domaines du management.</p>
<p>Notre équipe multidisciplinaire nous permet d''aborder les problématiques de recherche sous différents angles et d''offrir une vision complète des enjeux managériaux.</p>', 
'fas fa-users', 3);

-- Insertion des valeurs de l'entreprise
INSERT INTO about_values (title, description, icon, display_order) VALUES
('Excellence académique', 'Nous nous engageons à maintenir les plus hauts standards de rigueur scientifique dans toutes nos recherches.', 'fas fa-award', 1),
('Innovation', 'Nous encourageons les approches novatrices et créatives pour résoudre les problèmes complexes du management.', 'fas fa-lightbulb', 2),
('Collaboration', 'Nous croyons en la puissance du travail d''équipe et des partenariats nationaux et internationaux.', 'fas fa-handshake', 3),
('Impact sociétal', 'Nous visons à produire des recherches qui ont un impact positif sur les entreprises et la société marocaine.', 'fas fa-globe-africa', 4);

-- Insertion des axes de recherche
INSERT INTO research_areas (title, description, detailed_description, research_points, icon, display_order) VALUES
('Entreprises familiales', 
'Étude des spécificités des entreprises familiales marocaines, leur gouvernance, leur transmission et leur pérennité.',
'Notre recherche sur les entreprises familiales se concentre sur les défis uniques auxquels font face ces organisations, notamment en matière de gouvernance, de professionnalisation et de transmission intergénérationnelle.',
'["Gouvernance des entreprises familiales", "Succession et transmission", "Professionnalisation des entreprises familiales", "Dynamiques familiales et performance"]',
'fas fa-home', 1),

('PME et entrepreneuriat', 
'Analyse des stratégies de croissance des PME marocaines et des dynamiques entrepreneuriales.',
'Cette thématique explore les mécanismes de croissance des PME, leurs stratégies d''internationalisation et les facteurs favorisant l''innovation entrepreneuriale.',
'["Stratégies de croissance des PME", "Internationalisation des PME", "Entrepreneuriat et innovation", "Écosystème entrepreneurial marocain"]',
'fas fa-rocket', 2),

('Management stratégique', 
'Étude des processus stratégiques et des pratiques managériales dans le contexte marocain.',
'Nos recherches portent sur l''adaptation des entreprises aux changements environnementaux et l''adoption de pratiques managériales innovantes.',
'["Stratégies d''adaptation aux changements", "Management de l''innovation", "Responsabilité sociale des entreprises", "Transformation digitale"]',
'fas fa-chess', 3);

-- Mise à jour de l'équipe avec les nouvelles catégories
UPDATE team_members SET 
    category = 'direction',
    specialization = 'Management Stratégique, Entreprises Familiales',
    research_interests = 'Gouvernance des entreprises familiales, Stratégies de croissance, Transmission intergénérationnelle'
WHERE display_order = 1;

UPDATE team_members SET 
    category = 'researcher',
    specialization = 'Gouvernance d''entreprise, Entrepreneuriat',
    research_interests = 'Gouvernance des entreprises familiales, Transmission intergénérationnelle, Leadership féminin'
WHERE display_order = 2;

UPDATE team_members SET 
    category = 'researcher',
    specialization = 'Stratégie internationale, PME',
    research_interests = 'Internationalisation des PME, Stratégies d''entrée sur les marchés étrangers'
WHERE display_order = 3;

UPDATE team_members SET 
    category = 'researcher',
    specialization = 'Entrepreneuriat, Innovation',
    research_interests = 'Entrepreneuriat féminin, Innovation dans les PME, Écosystème entrepreneurial'
WHERE display_order = 4;

-- Insertion des types d'activités
INSERT INTO activity_types (name, description, icon, display_order) VALUES
('Séminaires de recherche', 'Présentations de travaux de recherche par nos chercheurs et doctorants', 'fas fa-chalkboard-teacher', 1),
('Colloques et conférences', 'Événements académiques nationaux et internationaux', 'fas fa-users', 2),
('Ateliers méthodologiques', 'Formations et ateliers sur les méthodes de recherche', 'fas fa-tools', 3),
('Journées doctoriales', 'Événements dédiés aux doctorants en sciences de gestion', 'fas fa-graduation-cap', 4),
('Partenariats', 'Collaborations avec institutions et organisations', 'fas fa-handshake', 5);

-- Insertion des activités
INSERT INTO activities (type_id, title, description, content, start_date, location, organizer, status, is_featured) VALUES
(1, 'Séminaire: Gouvernance des entreprises familiales au Maroc', 
'Présentation des derniers travaux de recherche sur la gouvernance des entreprises familiales marocaines.',
'<p>Ce séminaire présente les résultats d''une étude longitudinale sur les pratiques de gouvernance dans les entreprises familiales marocaines.</p><p>Les thèmes abordés incluent :</p><ul><li>Structures de gouvernance familiale</li><li>Conseils d''administration et comités</li><li>Gestion des conflits familiaux</li><li>Performance et gouvernance</li></ul>',
'2024-06-15', 'Amphithéâtre FSJES - Marrakech', 'Dr. Mohammed Alami', 'upcoming', 1),

(2, 'Colloque International: PME et Innovation en Méditerranée', 
'Colloque bisannuel sur les enjeux d''innovation dans les PME méditerranéennes.',
'<p>Ce colloque international réunit chercheurs, entrepreneurs et décideurs pour échanger sur les défis de l''innovation dans les PME de la région méditerranéenne.</p><p>Axes thématiques :</p><ul><li>Innovation technologique et PME</li><li>Écosystèmes d''innovation</li><li>Financement de l''innovation</li><li>Politiques publiques d''accompagnement</li></ul>',
'2024-10-20', 'Hôtel Hivernage - Marrakech', 'GREFSO & Partenaires', 'upcoming', 1),

(3, 'Atelier: Méthodes qualitatives en sciences de gestion', 
'Formation aux méthodes de recherche qualitative pour doctorants et jeunes chercheurs.',
'<p>Cet atelier méthodologique offre une formation pratique aux méthodes de recherche qualitative en sciences de gestion.</p><p>Programme :</p><ul><li>Entretiens semi-directifs</li><li>Observation participante</li><li>Analyse de contenu</li><li>Logiciels d''analyse qualitative</li></ul>',
'2024-04-10', 'Salle de conférence FSJES', 'Dr. Fatima Zahra Benali', 'completed', 0),

(4, 'Journées Doctoriales en Management 2024', 
'Événement annuel dédié à la présentation des travaux de thèse des doctorants.',
'<p>Les Journées Doctoriales en Management offrent une plateforme aux doctorants pour présenter leurs travaux de recherche et bénéficier des retours de la communauté académique.</p><p>Cette édition met l''accent sur :</p><ul><li>Entreprises familiales et gouvernance</li><li>Entrepreneuriat et innovation</li><li>Management stratégique</li><li>Méthodes de recherche</li></ul>',
'2024-05-25', 'Campus Universitaire - Marrakech', 'GREFSO & AMDEM', 'upcoming', 1);

-- Insertion des partenariats d'activités
INSERT INTO activity_partnerships (activity_id, partner_id, partnership_type) VALUES
(2, 1, 'organizer'), -- UCA comme organisateur du colloque
(2, 2, 'sponsor'),   -- CGEM comme sponsor
(4, 1, 'organizer'), -- UCA comme organisateur des journées doctoriales
(4, 3, 'supporter'); -- AFEM comme supporteur

-- Mise à jour des statistiques
UPDATE site_statistics SET 
    total_events = (SELECT COUNT(*) FROM activities WHERE is_active = 1),
    total_members = (SELECT COUNT(*) FROM team_members WHERE is_active = 1),
    last_updated = CURRENT_TIMESTAMP;