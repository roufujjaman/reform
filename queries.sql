-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

-- following 5 insertion dataset is populated by ChatGPT
-- inserting users `users`
INSERT INTO "users" ("display_name", "about", "type", "username", "password") VALUES 
    ('David J. Malan', 'CS professor at Harvard, tech educator.', 'person', 'davidmalan', 'uhnvbgftrhn'),
    ('Lex Fridman', 'AI researcher and podcaster.', 'person', 'lexfri', 'lncvbnmirt'),
    ('Yuval Noah Harari', 'Historian and author of "Sapiens".', 'person', 'yuvalnoah', 'powedgvbcf'),
    ('Ada Lovelace', 'Pioneer of computer programming.', 'person', 'adalove', 'qwertyuiop'),
    ('Elon Musk', 'CEO of Tesla and SpaceX.', 'person', 'elonmusk', 'asdzxcvbnm'),
    ('Grace Hopper', 'Inventor of the first compiler.', 'person', 'gracehop', 'plmoknijb'),
    ('Alan Turing', 'Father of modern computer science.', 'person', 'alanturing', 'lkjhgfdsaz'),
    ('Marie Curie', 'Nobel-winning physicist and chemist.', 'person', 'mariecurie', 'poiuytrewq'),
    ('Nikola Tesla', 'Inventor and electrical engineer.', 'person', 'nikolatesla', 'zxcvbnmasd'),
    ('Katherine Johnson', 'NASA mathematician.', 'person', 'kathjohnson', 'mnbvcxzasd'),
    ('Tim Berners-Lee', 'Inventor of the World Wide Web.', 'person', 'timberners', 'asdfghjkl'),
    ('Stephen Hawking', 'Theoretical physicist, author.', 'person', 'stephenhawk', 'qazwsxedc'),
    ('Carl Sagan', 'Astronomer, author, and science communicator.', 'person', 'carlsagan', 'edcrfvtgby'),
    ('Jane Goodall', 'Primatologist, chimpanzee researcher.', 'person', 'janegoodall', 'fghjklpoi'),
    ('Rosalind Franklin', 'Key contributor to DNA structure discovery.', 'person', 'rosfranklin', 'hjkluytre'),
    ('Sundar Pichai', 'CEO of Google.', 'person', 'sundarp', 'vbnmnbvcxz'),
    ('Mark Zuckerberg', 'Co-founder and CEO of Facebook.', 'person', 'markzuck', 'nmkjlopokl'),
    ('Jeff Bezos', 'Founder of Amazon.', 'person', 'jeffbezos', 'zxcvbmnbvc'),
    ('Satya Nadella', 'CEO of Microsoft.', 'person', 'satyanad', 'lkjhgtfrde'),
    ('Sheryl Sandberg', 'COO of Facebook.', 'person', 'sheryls', 'mnbvccxzas'),
    ('Steve Jobs', 'Co-founder of Apple.', 'person', 'stevejobs', 'wertyuiklm'),
    ('Bill Gates', 'Co-founder of Microsoft.', 'person', 'billgates', 'wertyuiopa'),
    ('Larry Page', 'Co-founder of Google.', 'person', 'larrypage', 'qazxswedcv'),
    ('Sergey Brin', 'Co-founder of Google.', 'person', 'sergeybrin', 'rtyuiklmnv'),
    ('Linus Torvalds', 'Creator of Linux kernel.', 'person', 'linust', 'asdfqwerty'),
    ('Dennis Ritchie', 'Co-creator of Unix and C language.', 'person', 'dennritchie', 'poiuytrewq'),
    ('John von Neumann', 'Mathematician and polymath.', 'person', 'vonneumann', 'plokijmnbv'),
    ('Claude Shannon', 'Father of information theory.', 'person', 'claudeshannon', 'hjklpoiuyt'),
    ('Edwin Hubble', 'Astronomer, discovered universe expansion.', 'person', 'edhubble', 'kjhgfdsawa'),
    ('Richard Feynman', 'Nobel-winning physicist.', 'person', 'richardfeyn', 'mnbvghtrdx'),
    ('George Boole', 'Founder of Boolean algebra.', 'person', 'georgeboole', 'qazplmnbvc'),
    ('Isaac Newton', 'Physicist, laws of motion and gravity.', 'person', 'isaacnewton', 'xswerdfghy'),
    ('Leonhard Euler', 'Mathematician, major contributions to calculus.', 'person', 'leoneuler', 'xcvbnmlkjh'),
    ('Blaise Pascal', 'Mathematician, physicist, inventor.', 'person', 'blaispascal', 'wertyuiopl'),
    ('Thomas Edison', 'Inventor of the light bulb.', 'person', 'thomasedison', 'poiuytrews'),
    ('James Clerk Maxwell', 'Theorized electromagnetic waves.', 'person', 'jamesclerk', 'asdfghjklz'),
    ('Robert Oppenheimer', 'Father of the atomic bomb.', 'person', 'robertopp', 'mnbvcxzasa'),
    ('Niels Bohr', 'Nobel-winning physicist, quantum theory.', 'person', 'nielsbohr', 'plokimnhgf'),
    ('Max Planck', 'Founder of quantum theory.', 'person', 'maxplanck', 'zxcvbnmtyu'),
    ('Marie Tharp', 'Mapped the ocean floor.', 'person', 'marietharp', 'qwertyvcxz'),
    ('Richard Stallman', 'Free software advocate.', 'person', 'richstallman', 'mnbvtyujkm'),
    ('Vint Cerf', 'Co-inventor of the internet.', 'person', 'vintcerf', 'kjhgfdsawe'),
    ('Gordon Moore', 'Co-founder of Intel.', 'person', 'gordonmoore', 'vbnmasdfgh'),
    ('Jon von Neumann', 'Mathematician, game theory founder.', 'person', 'jonneumann', 'zxqwertybn'),
    ('Charles Babbage', 'Father of the computer.', 'person', 'charlesbabb', 'poiuylkjhg'),
    ('John McCarthy', 'Pioneer of AI, Lisp creator.', 'person', 'johnmccarthy', 'mnbvcxzqaz'),
    ('Ada Yonath', 'Nobel-winning crystallographer.', 'person', 'adayonath', 'wertyuioplm'),
    ('Edsger Dijkstra', 'Pioneer of algorithms.', 'person', 'edsgerdijk', 'vcxzasdfgh'),
    ('Barbara Liskov', 'Programming language pioneer.', 'person', 'barbliskov', 'qazplmnbvc'),
    ('Donald Knuth', 'Author of "The Art of Computer Programming".', 'person', 'donaldknuth', 'werfdcxzas');

-- inserting threads `threads`
INSERT INTO "threads" ("user_id", "title") VALUES 
    (2, 'Elon Musk: Neuralink and the Future of Humanity'), 
    (1, 'CS50'), 
    (1, 'CS50SQL'), 
    (3, 'Nexus: A Brief History of Information Networks from the Stone Age to AI'),
    (4, 'The Future of AI'), 
    (5, 'Climate Change and Our Responsibility'), 
    (6, 'Understanding Quantum Computing'), 
    (7, 'Exploring Space: The Next Frontier'), 
    (8, 'The Evolution of Programming Languages'), 
    (9, 'The Impact of Social Media on Society'), 
    (10, 'Innovations in Renewable Energy'), 
    (11, 'Blockchain Beyond Cryptocurrency'), 
    (12, 'The Art of Machine Learning'), 
    (13, 'History of the Internet'), 
    (14, 'Future of Work: Remote vs. In-Office'), 
    (15, 'Building Trust in AI Systems'), 
    (16, 'The Role of Ethics in Technology'), 
    (17, 'Advancements in Robotics'), 
    (18, 'Sustainable Architecture and Design'), 
    (19, 'Cryptography in the Digital Age'), 
    (20, 'The Science of Happiness'), 
    (21, 'Neuroscience: Understanding the Brain'), 
    (22, 'Data Science: A New Era of Insights'), 
    (23, 'The Challenges of Cybersecurity'), 
    (24, 'Artificial Intelligence and Ethics'), 
    (25, 'Augmented Reality in Everyday Life'), 
    (26, 'The Rise of E-commerce'), 
    (27, 'Diversity in Tech: A Necessity'), 
    (28, 'The Future of Virtual Reality'), 
    (29, 'Women in Science: Breaking Barriers'), 
    (30, 'History of Artificial Intelligence'), 
    (31, 'The Physics of Time Travel'), 
    (32, 'The Journey of a Startup'), 
    (33, 'Cognitive Behavioral Therapy Explained'), 
    (34, 'The Power of Data Visualization'), 
    (35, 'Smart Cities: The Urban Future'), 
    (36, 'The Science of Sleep'), 
    (37, 'Gene Editing: Ethics and Implications'), 
    (38, 'The Benefits of Mindfulness'), 
    (39, 'Personal Finance in the Digital Age'), 
    (40, 'Building a Career in Tech'), 
    (41, 'The Future of Transportation'), 
    (42, 'Exploring the Universe: Latest Discoveries'), 
    (43, 'Philosophy of Technology'), 
    (44, 'Sustainable Agriculture Practices'), 
    (45, 'The Psychology of Decision Making'), 
    (46, 'Advances in Healthcare Technology'), 
    (47, 'Understanding Human-Computer Interaction'), 
    (48, 'Social Impact of Technology'), 
    (49, 'Future Trends in Education'), 
    (50, 'Art and Technology: A New Era');

-- inserting into "tags"
INSERT INTO "tags" ("name") VALUES 
    ('AI'), 
    ('Climate Change'), 
    ('Quantum Computing'), 
    ('Space Exploration'), 
    ('Programming'), 
    ('Social Media'), 
    ('Renewable Energy'), 
    ('Blockchain'), 
    ('Machine Learning'), 
    ('Internet History'), 
    ('Remote Work'), 
    ('Ethics in Technology'), 
    ('Robotics'), 
    ('Sustainable Design'), 
    ('Cryptography'), 
    ('Happiness'), 
    ('Neuroscience'), 
    ('Data Science'), 
    ('Cybersecurity'), 
    ('Virtual Reality'), 
    ('E-commerce'), 
    ('Diversity in Tech'), 
    ('Augmented Reality'), 
    ('Women in Science'), 
    ('Artificial Intelligence History'), 
    ('Time Travel'), 
    ('Startups'), 
    ('Mindfulness'), 
    ('Data Visualization'), 
    ('Smart Cities'), 
    ('Gene Editing'), 
    ('Personal Finance'), 
    ('Career in Tech'), 
    ('Transportation Future'), 
    ('Universe Discoveries'), 
    ('Philosophy'), 
    ('Sustainable Agriculture'), 
    ('Decision Making'), 
    ('Healthcare Technology'), 
    ('Human-Computer Interaction'), 
    ('Social Impact'), 
    ('Education Trends'), 
    ('Art and Technology');

-- inserting into "thread_tags"
INSERT INTO "thread_tags" ("thread_id", "tag_id") VALUES 
    (1, 1),  -- Donald Trump Interview: AI
    (1, 12), -- Donald Trump Interview: Ethics in Technology
    (2, 22), -- CS50: Data Science
    (2, 5),  -- CS50: Programming
    (3, 22), -- CS50SQL: Data Science
    (4, 1),  -- Nexus: AI
    (4, 10), -- Nexus: Internet History
    (5, 1),  -- The Future of AI: AI
    (5, 25), -- The Future of AI: Artificial Intelligence and Ethics
    (6, 2),  -- Climate Change and Our Responsibility: Climate Change
    (6, 19), -- Climate Change: Sustainable Design
    (7, 3),  -- Understanding Quantum Computing: Quantum Computing
    (8, 10), -- Exploring Space: Space Exploration
    (8, 8),  -- Exploring Space: AI
    (9, 9),  -- The Evolution of Programming Languages: Programming
    (10, 1), -- The Impact of Social Media: AI
    (10, 23), -- The Impact of Social Media: Cybersecurity
    (11, 2), -- Innovations in Renewable Energy: Climate Change
    (11, 7), -- Innovations in Renewable Energy: Renewable Energy
    (12, 11), -- Blockchain Beyond Cryptocurrency: Blockchain
    (12, 1), -- Blockchain Beyond Cryptocurrency: AI
    (13, 12), -- The Art of Machine Learning: Ethics in Technology
    (13, 22), -- The Art of Machine Learning: Data Science
    (14, 10), -- History of the Internet: Internet History
    (15, 14), -- Future of Work: Remote vs. In-Office: Technology
    (16, 1), -- Building Trust in AI Systems: AI
    (16, 17), -- Building Trust in AI Systems: Ethics in Technology
    (17, 12), -- Advancements in Robotics: Robotics
    (18, 19), -- Sustainable Architecture: Sustainable Design
    (19, 20), -- Cryptography in the Digital Age: Cryptography
    (20, 21), -- The Science of Happiness: Psychology
    (21, 23), -- Neuroscience: Understanding the Brain: Data Science
    (22, 22), -- Data Science: A New Era of Insights: Data Science
    (23, 24), -- The Challenges of Cybersecurity: Cybersecurity
    (24, 1), -- Artificial Intelligence and Ethics: AI
    (25, 28), -- Augmented Reality: Diversity in Tech
    (26, 6), -- The Rise of E-commerce: E-commerce
    (27, 27), -- Diversity in Tech: Diversity in Tech
    (28, 29), -- The Future of Virtual Reality: Virtual Reality
    (29, 30), -- Women in Science: Breaking Barriers: Women in Science
    (30, 31), -- History of Artificial Intelligence: AI
    (31, 32), -- The Physics of Time Travel: Time Travel
    (32, 3),  -- The Journey of a Startup: Entrepreneurship
    (33, 34), -- Cognitive Behavioral Therapy: Psychology
    (34, 35), -- The Power of Data Visualization: Data Science
    (35, 36), -- Smart Cities: Urban Planning
    (36, 20), -- The Science of Sleep: Psychology
    (37, 38), -- Gene Editing: Ethics and Implications: Ethics
    (38, 39), -- The Benefits of Mindfulness: Mindfulness
    (39, 40), -- Personal Finance: Personal Finance
    (40, 41), -- Building a Career in Tech: Career Development
    (41, 42), -- The Future of Transportation: Transportation
    (42, 43), -- Exploring the Universe: Latest Discoveries: Space Exploration
    (43, 44), -- Philosophy of Technology: Philosophy
    (44, 45), -- Sustainable Agriculture Practices: Sustainable Agriculture
    (45, 46), -- The Psychology of Decision Making: Psychology
    (46, 47), -- Advances in Healthcare Technology: Healthcare
    (47, 48), -- Understanding Human-Computer Interaction: HCI
    (48, 49), -- Social Impact of Technology: Social Impact
    (49, 50), -- Future Trends in Education: Education
    (50, 51); -- Art and Technology: Art

-- inserting into "posts"
INSERT INTO "posts" ("user_id", "title", "content", "posted_at", "likes") VALUES
    (1, 'New CS50 Announcement', 'Excited to announce new updates to the CS50 curriculum. Stay tuned for more details!', '2019-03-10 14:35:00', 108),
    (2, 'Podcast Episode 30', 'In this episode, we discuss the impact of artificial intelligence on daily life.', '2020-01-25 09:15:00', 66),
    (3, 'Quantum Computing Explained', 'A brief introduction to the world of quantum computing and its future potential.', '2023-04-05 11:45:00', 18),
    (4, 'Introduction to AI Ethics', 'A critical look at the ethical considerations of AI systems.', '2017-06-15 10:20:00', 106),
    (5, 'Climate Change Action', 'Why we need to act now to mitigate the worst effects of climate change.', '2022-07-08 13:45:00', 53),
    (6, 'Understanding Quantum Bits', 'An easy-to-follow explanation of how qubits work in quantum computers.', '2021-09-12 16:30:00', 43),
    (7, 'Space Exploration Updates', 'NASA announces new missions to explore the outer solar system.', '2018-11-22 18:10:00', 22),
    (8, 'Programming Language Trends', 'A deep dive into the evolution of programming languages over the last decade.', '2015-02-05 12:05:00', 13),
    (9, 'Social Media''s Impact on Society', 'Exploring how social platforms have reshaped communication globally.', '2021-05-18 09:50:00', 95),
    (10, 'Innovations in Renewable Energy', 'Recent breakthroughs in solar energy that could change the world.', '2020-10-22 15:35:00', 107),
    (1, 'Blockchain and Beyond', 'Exploring the applications of blockchain technology beyond cryptocurrencies.', '2022-03-02 08:15:00', 61),
    (2, 'The Art of Machine Learning', 'A look at the artistry involved in designing effective machine learning models.', '2023-06-01 14:40:00', 67),
    (3, 'History of the Internet', 'How the internet has evolved from its early days to what we know today.', '2017-08-11 11:10:00', 56),
    (4, 'Remote Work vs. Office Work', 'Examining the future of work and the ongoing debate over remote vs. in-office setups.', '2019-12-21 13:55:00', 37),
    (5, 'AI and Human Trust', 'How can we ensure AI systems are trustworthy and reliable?', '2021-01-05 10:25:00', 48),
    (6, 'Robotics: The Next Frontier', 'Discussing the latest advancements in the field of robotics.', '2020-09-17 17:00:00', 12),
    (7, 'Sustainable Architecture', 'Innovative design solutions for environmentally sustainable buildings.', '2016-11-29 08:40:00', 97),
    (8, 'Modern Cryptography', 'An introduction to encryption methods used in today''s digital landscape.', '2022-04-13 19:20:00', 33),
    (9, 'Neuroscience Breakthroughs', 'The latest research on brain function and its implications for mental health.', '2015-06-07 10:50:00', 25),
    (10, 'Data Science Insights', 'How data science is driving the next wave of business innovation.', '2021-03-25 09:35:00', 101),
    (1, 'Challenges in Cybersecurity', 'The growing importance of cybersecurity in our increasingly digital world.', '2018-01-14 15:45:00', 26),
    (2, 'Ethics in AI Development', 'What ethical considerations should guide AI research and development?', '2020-06-03 11:30:00', 100),
    (3, 'Augmented Reality Today', 'The latest uses of augmented reality in education and entertainment.', '2016-10-05 14:15:00', 84),
    (4, 'E-commerce Explosion', 'How online shopping trends are reshaping the global economy.', '2019-07-19 12:25:00', 35),
    (5, 'The Virtual Reality Revolution', 'What does the future hold for virtual reality technology?', '2023-01-08 16:55:00', 81),
    (6, 'Women in Tech', 'Celebrating the contributions of women in the technology sector.', '2020-02-23 09:40:00', 67),
    (7, 'Artificial Intelligence: A History', 'Tracing the development of AI from the 1950s to today.', '2022-12-09 08:20:00', 97),
    (8, 'The Physics of Time Travel', 'Exploring the scientific theories that suggest time travel might be possible.', '2021-04-16 13:10:00', 58),
    (9, 'Startup Success Stories', 'Insights from successful entrepreneurs on building a tech startup.', '2017-05-25 17:45:00', 46),
    (10, 'The Psychology of Sleep', 'Why sleep is essential for mental and physical well-being.', '2015-08-14 10:00:00', 78),
    (1, 'Gene Editing: What''s Next?', 'Discussing the ethical and practical implications of gene editing.', '2023-09-07 15:20:00', 34),
    (2, 'Mindfulness and Mental Health', 'How mindfulness practices can improve mental health outcomes.', '2021-10-03 18:05:00', 62),
    (3, 'Digital Finance: The Future', 'How blockchain and cryptocurrencies are reshaping personal finance.', '2022-02-12 14:30:00', 33),
    (4, 'Building a Tech Career', 'Tips for those starting or advancing their careers in technology.', '2019-11-06 09:55:00', 57),
    (5, 'Transportation of Tomorrow', 'Autonomous vehicles and electric cars: what''s coming next?', '2016-04-17 12:45:00', 17),
    (6, 'Space: Final Discoveries', 'New findings from NASA''s deep space missions.', '2018-08-29 14:50:00', 49),
    (7, 'Technology and Philosophy', 'Exploring the philosophical questions raised by modern technology.', '2023-05-19 11:15:00', 28),
    (8, 'Sustainable Agriculture', 'How technology is driving sustainable farming practices.', '2020-07-12 08:30:00', 14),
    (9, 'Decision Making and Psychology', 'The role of psychology in understanding how people make decisions.', '2022-06-24 16:40:00', 76),
    (10, 'Healthcare Tech Innovations', 'How technology is transforming the healthcare industry.', '2017-03-10 09:15:00', 106),
    (1, 'Human-Computer Interaction', 'Understanding how humans interact with machines in the digital age.', '2020-12-01 13:00:00', 95),
    (2, 'The Social Impact of Tech', 'Discussing the broader social implications of technology development.', '2019-02-22 10:45:00', 27),
    (3, 'Education in the Digital Age', 'How technology is transforming education for the better.', '2021-07-05 09:20:00', 84),
    (4, 'Art and Technology', 'How technology is influencing modern artistic practices.', '2022-11-16 17:05:00', 31);



-- testing comment featire
-- inserting into "post_comments"
INSERT INTO "comments" ("post_id", "user_id", "comment")
VALUES (2, 3, 'this is a comment');

INSERT INTO "comments" ("comment_id", "user_id", "comment")
VALUES (1, 3, 'this is a replay');

-- testing the trigger on 'votes'