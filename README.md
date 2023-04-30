# Nvim
My nvim conifgurations


## Issues and Bugs Fix History
### Jan 20, 2023
* Nvim Treesitter had issues with nvim version 0.7.2
	* Treesitter has a breaking change that doesn't work correctly in 0.7.2
	* Updated nvim via binary installation to 0.8.2 --> resolved most issues
* Treesitter/highlight issue on vim.cmd [[packadd packer.nvim]]
	* Added vim as parser to Nvim Treesiter parser list
* Nvim Tree - create_in_closed_folder is deprecated and is a default option
	* Fixed by removing the boolean config in nvim-tree.lua setup
* Error - Error executing lua: Vim(return):E121: Undefined variable: can_jump_forwards stack traceback: [C]: in function 'UltiSnips#CanJumpForwards' 
	* Issue - Failed to load python3 host. You can try to see wha...ile. Also, the host stderr is available in messages. 
		* :checkhealth logs
			* ERROR: pynvim is not installed
			* Command error (job=9, exit code 1) ...
	* Fix - Installed and updated pynvim
