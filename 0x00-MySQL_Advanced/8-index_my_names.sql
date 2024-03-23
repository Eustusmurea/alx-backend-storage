-- Index the names table by the first letter of the name column
CREATE INDEX idx_name_first ON names ( name(1) );
