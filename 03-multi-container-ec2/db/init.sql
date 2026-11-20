-- Create tasks table if it doesn't exist
CREATE TABLE IF NOT EXISTS tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    done BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample tasks into the tasks table
INSERT INTO tasks (title, done) VALUES
    ('Write the Dockerfile', TRUE),
    ('Set up the Nginx reverse proxy', TRUE),
    ('Deploy Flask + MySQL on EC2 with Compose', FALSE);
