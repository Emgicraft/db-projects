USE BibliotecaDigital;

-- Insertar valores en Categoría
INSERT INTO Categoria (Nombre) VALUES
('Ciencia'),
('Literatura'),
('Tecnología'),
('Historia'),
('Arte');

-- Insertar valores en Libro
INSERT INTO Libro (Titulo, Autor, Anio_publicacion, Resumen, NumPaginas, Editorial, Categoria_ID) VALUES
-- Categoría: Ciencia
('El origen de las especies', 'Charles Darwin', 1859, 'Libro seminal sobre la teoría de la evolución.', 502, 'John Murray', 1),
('Breve historia del tiempo', 'Stephen Hawking', 1988, 'Una introducción a la cosmología moderna.', 256, 'Bantam Books', 1),
('El gen egoísta', 'Richard Dawkins', 1976, 'Teoría sobre la evolución basada en los genes.', 352, 'Oxford University Press', 1),
('La estructura de las revoluciones científicas', 'Thomas Kuhn', 1962, 'Análisis de los paradigmas en la ciencia.', 264, 'University of Chicago Press', 1),
('La doble hélice', 'James D. Watson', 1968, 'Historia del descubrimiento de la estructura del ADN.', 256, 'Atheneum', 1),
('Cosmos', 'Carl Sagan', 1980, 'Exploración del universo y la vida en él.', 384, 'Random House', 1),
('El tejido del cosmos', 'Brian Greene', 2004, 'Exploración de la naturaleza del espacio y el tiempo.', 624, 'Knopf', 1),
('La partícula divina', 'Leon Lederman', 1993, 'Historia del bosón de Higgs.', 256, 'Houghton Mifflin', 1),
('El universo en una cáscara de nuez', 'Stephen Hawking', 2001, 'Exploración de la cosmología moderna.', 224, 'Bantam Books', 1),
('La física del futuro', 'Michio Kaku', 2011, 'Predicciones sobre la ciencia y la tecnología del futuro.', 384, 'Doubleday', 1),
('El cerebro y la inteligencia emocional', 'Daniel Goleman', 1995, 'Relación entre el cerebro y las emociones.', 384, 'Bantam Books', 1),
('La vida secreta de la mente', 'Ezequiel A. Di Paolo', 2014, 'Exploración de la conciencia y la mente humana.', 352, 'Anagrama', 1),
('El cerebro autista', 'Temple Grandin', 2007, 'Perspectiva sobre el autismo desde el interior.', 288, 'Perigee Books', 1),
('La mente del futuro', 'Ray Kurzweil', 2005, 'Predicciones sobre la inteligencia artificial y el futuro.', 672, 'Viking Press', 1),
('El cerebro emocional', 'Joseph LeDoux', 1996, 'Exploración de la relación entre emociones y cerebro.', 384, 'Viking Press', 1),
('La mente en el espejo', 'David Eagleman', 2010, 'Exploración de la neurociencia y la percepción.', 336, 'Pantheon Books', 1),
('El cerebro y la inteligencia emocional', 'Daniel Goleman', 1995, 'Relación entre el cerebro y las emociones.', 384, 'Bantam Books', 1),
('La vida secreta de la mente', 'Ezequiel A. Di Paolo', 2014, 'Exploración de la conciencia y la mente humana.', 352, 'Anagrama', 1),
-- Categoría: Literatura
('Cien años de soledad', 'Gabriel García Márquez', 1967, 'Obra maestra de la literatura latinoamericana.', 417, 'Sudamericana', 2),
('El gran Gatsby', 'F. Scott Fitzgerald', 1925, 'Una crítica a la sociedad estadounidense de los años 20.', 180, 'Scribner', 2),
('Crónica de una muerte anunciada', 'Gabriel García Márquez', 1981, 'Una novela sobre el destino y la fatalidad.', 120, 'Editorial Oveja Negra', 2),
('Cumbres borrascosas', 'Emily Brontë', 1847, 'Una historia de amor y venganza en los páramos ingleses.', 416, 'Thomas Cautley Newby', 2),
('Don Quijote de la Mancha', 'Miguel de Cervantes', 1605, 'La obra cumbre de la literatura española.', 863, 'Francisco de Robles', 2),
('Orgullo y prejuicio', 'Jane Austen', 1813, 'Una historia sobre amor y prejuicios.', 432, 'T. Egerton', 2),
('1984', 'George Orwell', 1949, 'Novela distópica sobre un estado totalitario.', 328, 'Secker & Warburg', 2),
-- Categoría: Tecnología
('Clean Code', 'Robert C. Martin', 2008, 'Guía para escribir código limpio y mantenible.', 431, 'Prentice Hall', 3),
('The Pragmatic Programmer', 'Andrew Hunt y David Thomas', 1999, 'Guía para programadores prácticos.', 352, 'Addison-Wesley', 3),
('Design Patterns', 'Erich Gamma et al.', 1994, 'Un catálogo de patrones de diseño.', 395, 'Addison-Wesley', 3),
('Artificial Intelligence: A Modern Approach', 'Stuart Russell y Peter Norvig', 2021, 'Texto líder en inteligencia artificial.', 1136, 'Pearson', 3),
('Introduction to the Theory of Computation', 'Michael Sipser', 2012, 'Introducción a la teoría de la computación.', 488, 'Cengage Learning', 3),
('The Art of Computer Programming', 'Donald Knuth', 1968, 'Obra monumental sobre algoritmos y programación.', 3168, 'Addison-Wesley', 3),
('Code Complete', 'Steve McConnell', 2004, 'Guía para la construcción de software de calidad.', 960, 'Microsoft Press', 3),
('Refactoring: Improving the Design of Existing Code', 'Martin Fowler', 1999, 'Guía para mejorar el diseño del código existente.', 464, 'Addison-Wesley', 3),
('Aprendiendo Python', 'Mark Lutz', 2013, 'Guía completa para aprender Python.', 1600, 'O''Reilly Media', 3),
('JavaScript: The Good Parts', 'Douglas Crockford', 2008, 'Un enfoque sobre las mejores características de JavaScript.', 176, 'O''Reilly Media', 3),
('HTML y CSS: Diseño y construcción de sitios web', 'Jon Duckett', 2011, 'Guía visual para aprender HTML y CSS.', 512, 'Wiley', 3),
('Java: A Beginner''s Guide', 'Herbert Schildt', 2014, 'Introducción a la programación en Java.', 624, 'McGraw-Hill Education', 3),
('Python Crash Course', 'Eric Matthes', 2015, 'Un curso intensivo de Python.', 544, 'No Starch Press', 3),
('The Clean Coder: A Code of Conduct for Professional Programmers', 'Robert C. Martin', 2011, 'Guía sobre la ética profesional en la programación.', 256, 'Prentice Hall', 3),
-- Categoría: Historia
('Sapiens: De animales a dioses', 'Yuval Noah Harari', 2011, 'Breve historia de la humanidad.', 498, 'Debate', 4),
('Guns, Germs, and Steel', 'Jared Diamond', 1997, 'Impacto de la geografía en el desarrollo humano.', 480, 'W. W. Norton & Company', 4),
('El espejo enterrado', 'Carlos Fuentes', 1992, 'Historia cultural de Hispanoamérica.', 416, 'Fondo de Cultura Económica', 4),
('Historia de las civilizaciones', 'Arnold Toynbee', 1934, 'Análisis de las civilizaciones humanas.', 850, 'Oxford University Press', 4),
('Historia de la Segunda Guerra Mundial', 'Antony Beevor', 1998, 'Narrativa completa de la Segunda Guerra Mundial.', 928, 'Viking Press', 4),
('El siglo de las luces', 'Alejo Carpentier', 1962, 'Novela sobre la Revolución Francesa y su impacto en el Caribe.', 384, 'Editorial Losada', 4),
('Los miserables', 'Victor Hugo', 1862, 'Novela sobre la justicia social en Francia.', 1463, 'A. Lacroix, Verboeckhoven & Cie', 4),
('El nombre de la rosa', 'Umberto Eco', 1980, 'Novela histórica y de misterio ambientada en una abadía medieval.', 512, 'Bompiani', 4),
('La historia interminable', 'Michael Ende', 1979, 'Novela fantástica sobre un libro mágico.', 396, 'Thienemann Verlag', 4),
('Los pilares de la Tierra', 'Ken Follett', 1989, 'Novela histórica sobre la construcción de una catedral en la Edad Media.', 973, 'Macmillan Publishers', 4),
('El arte de la guerra', 'Sun Tzu', -500, 'Tratado militar sobre estrategia y táctica.', 272, 'Taschen', 4),
('Historia del arte', 'H. W. Janson', 1962, 'Historia completa del arte desde la prehistoria hasta el presente.', 896, 'Harry N. Abrams', 4),
('El arte de la guerra', 'Sun Tzu', -500, 'Tratado militar sobre estrategia y táctica.', 272, 'Taschen', 4),
('Historia del arte', 'H. W. Janson', 1962, 'Historia completa del arte desde la prehistoria hasta el presente.', 896, 'Harry N. Abrams', 4),
('Los grandes hombres de la historia', 'Paul Johnson', 1991, 'Biografías de figuras históricas influyentes.', 512, 'HarperCollins', 4),
('La historia de la filosofía occidental', 'Bertrand Russell', 1945, 'Análisis de la filosofía desde los griegos hasta el siglo XX.', 784, 'Simon & Schuster', 4),
-- Categoría: Arte
('La interpretación de las artes visuales', 'Erwin Panofsky', 1939, 'Ensayo sobre la interpretación de las obras de arte.', 340, 'Harvard University Press', 5),
('Los principios del diseño', 'William Lidwell', 2003, 'Guía básica para diseñadores.', 272, 'Rockport Publishers', 5),
('El Renacimiento', 'Andrew Graham-Dixon', 1999, 'Estudio detallado sobre el Renacimiento.', 400, 'Thames & Hudson', 5),
('La historia del arte', 'E. H. Gombrich', 1950, 'Introducción a la historia del arte universal.', 688, 'Phaidon Press', 5),
('El arte de la fotografía', 'Andreas Gursky', 2001, 'Exploración del arte contemporáneo a través de la fotografía.', 240, 'Steidl', 5),
('El arte de la guerra', 'Sun Tzu', -500, 'Tratado militar sobre estrategia y táctica.', 272, 'Taschen', 5),
('Historia del arte', 'H. W. Janson', 1962, 'Historia completa del arte desde la prehistoria hasta el presente.', 896, 'Harry N. Abrams', 5),
('El arte de amar', 'Erich Fromm', 1956, 'Reflexiones sobre el amor y las relaciones humanas.', 384, 'Harper & Row', 5),
('El arte de la felicidad', 'Dalai Lama y Howard Cutler', 1998, 'Reflexiones sobre la felicidad y el bienestar.', 368, 'Riverhead Books', 5);

-- Insertar usuarios
INSERT INTO USUARIO (Nombre, Clave_Hash, Email, Estado) VALUES 
('mgarcia', UPPER(SHA2('Empresa#123', 256)), 'moises.garcia@empresa.com', 1),
('rlopez', UPPER(SHA2('rlopez123', 256)), 'rodrigo.lopez@empresa.com', 1),
('amartinez', UPPER(SHA2('Ana2024', 256)), 'ana.martinez@empresa.com', 1);

-- Insertar roles
INSERT INTO ROL (Nombre) VALUES 
('Administrador'),
('Gerente'),
('Vendedor');

-- Asignar roles
INSERT INTO USUARIO_ROL (UsuarioID, RolID) VALUES 
(1, 1), (1, 2), (1, 3),
(2, 2), (2, 3),
(3, 2);