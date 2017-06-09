<?php

/**
 * @author Fathoni <m.fathoni@mail.com>
 * @property CI_DB_query_builder $db
 */
class FileProposal_model extends CI_Model
{
	public $id;
	public $proposal_id;
	public $syarat_id;
	public $nama_file;
	public $nama_asli;
	public $created_at;
	public $updated_at;
	
	/**
	 * @param int $proposal_id
	 * @return FileProposal_model[]
	 */
	public function list_by_proposal($proposal_id)
	{
		return $this->db->get_where('file_proposal', array(
			'proposal_id' => $proposal_id
		))->result();
	}
	
	public function get_single($id)
	{
		return $this->db->get_where('file_proposal', ['id' => $id], 1)->row();
	}
	
	public function insert()
	{
		
	}
	
	public function delete_by_proposal($proposal_id)
	{
		return $this->db->delete('file_proposal', ['proposal_id' => $proposal_id]);
	}
}
