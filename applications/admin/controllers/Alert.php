<?php

/**
 * @author Fathoni
 */
class Alert extends Admin_Controller
{
	public function error()
	{
		$this->smarty->display();
	}
	
	public function success()
	{
		$this->smarty->display();
	}
}
