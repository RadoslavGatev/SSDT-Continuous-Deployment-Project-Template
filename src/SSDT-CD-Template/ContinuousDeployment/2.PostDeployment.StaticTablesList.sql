/*

	1. Invoke the following procedure to generate your MERGE statements:
		Example: EXEC sp_generate_merge @schema = 'dbo', @table_name ='Table'

	2. Paste it to a new file in the StaticTables folder.

	3. Include it in the list below. Order of the tables in the list depends on your table relationships.
		Begin with the tables at the end of your relationship chain.

*/

	--:r .\StaticTables\StaticTableExample.sql