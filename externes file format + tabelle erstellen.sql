Create external file format weathercsv
WITH
(
    Format_type = delimitedtext,
		Format_Options(
			FIELD_TERMINATOR = ',',
			string_delimiter = '',
			first_row = 2
		
			)
)






