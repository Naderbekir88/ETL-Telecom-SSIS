
create procedure dbo.usp_insert_dim_audit 
	-- @batch_id int = -1,
	@package_name nvarchar(255),
	@file_name nvarchar(255),
	@rows_input_rejected int = -1,
	@rows_processed int = -1,
	@rows_output_rejected int = -1
as
begin
INSERT INTO [dbo].[dim_audit] (
           [package_name],
           [file_name],
           [rows_extracted],
           [rows_inserted],
           [rows_rejected]
		)
     VALUES (
		   @package_name, 
		   @file_name,
		   -- extracted records
		   @rows_input_rejected + @rows_processed,
		   -- inserted records
		   @rows_processed - @rows_output_rejected,
		   @rows_output_rejected
	)
end

