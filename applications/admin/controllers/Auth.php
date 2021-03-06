<?php

/**
 * @author Fathoni <m.fathoni@mail.com>
 */
class Auth extends Admin_Controller
{	
	public function login_disabled()
	{
		// jika sudah ada login, redirect ke home
		if ($this->session->userdata('user') != NULL)
		{
			redirect(site_url('home'));
			exit();
		}
			
		if ($_SERVER['REQUEST_METHOD'] == 'POST')
		{
			$username	= $this->input->post('username');
			$password	= $this->input->post('password');
			
			$user = $this->db->get_where('user', array(
				'username' => $username,
				'tipe_user' => TIPE_USER_ADMIN
			))->row();
			
			// Jika row ada
			if ($user != null)
			{
				// Bandingkan password, temporari --> password
				if ($user->password_hash == sha1($password))
				{
					// Assign data login ke session
					$this->session->set_userdata('user', $user);
					
					redirect(site_url('home'));
				}
			}
			
			$this->session->set_flashdata('failed_login', TRUE);
		}
		
		$this->smarty->display();
	}
	
	public function logout()
	{
		$this->session->unset_userdata('user');

		// redirect to home
		redirect(base_url());
	}
	
	public function test_email_template($file_tpl)
	{
		$this->smarty->display("email/{$file_tpl}");
	}
}
