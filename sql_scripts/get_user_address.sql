CREATE OR REPLACE FUNCTION get_user_address()
RETURNS TABLE(user_id integer, user_name character varying, user_age integer, address character varying, pincode character varying)
LANGUAGE 'plpgsql'
COST 100
VOLATILE PARALLEL UNSAFE
ROWS 10000
AS $BODY$
BEGIN
RETURN QUERY
SELECT 
	user_table.user_Id, 
	user_table.user_name,
	user_table.user_age,
	user_address.address,
	user_address.pin_code
FROM public.user_table
JOIN user_address ON user_address.user_id = user_table.user_id;

END;
$BODY$;