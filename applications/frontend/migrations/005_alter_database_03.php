<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @author Fathoni <m.fathoni@mail.com>
 * @property CI_DB_forge $dbforge
 * @property CI_DB_query_builder $db
 */
class Migration_Alter_Database_03 extends CI_Migration
{
	function up()
	{
		// add column
		echo "  > add column program.nama_program_singkat ... ";
		$this->dbforge->add_column('program', array(
			'COLUMN nama_program_singkat VARCHAR(10) NULL'
		));
		echo "OK\n";
		
		// modify data
		echo "  > update data program ... ";
		$this->db->update('program', ['nama_program_singkat' => 'PBBT'], ['id' => 1]);
		$this->db->update('program', ['nama_program_singkat' => 'KBMI'], ['id' => 2]);
		echo "OK\n";
	}
	
	function down()
	{
		// drop column
		echo "  > drop column program.nama_program_singkat ... ";
		$this->dbforge->drop_column('program', 'nama_program_singkat');
		echo "OK\n";
	}
}
