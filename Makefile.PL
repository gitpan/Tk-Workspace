use ExtUtils::MakeMaker;
# Refer to lib/Extutils/MakeMaker.pm for details of 
# how to influence the contents of the Makefile that
# is written.

WriteMakefile( PREREQ_PM => { "Tk"  => '800.022' },
	       NAME => 'Tk::XFontSelect',
	       VERSION_FROM => 'XFontSelect.pm',
	       "dist"  => { COMPRESS  => "gzip -9f",
			    SUFFIZ    => ".gz"  } 
	       );
	      
WriteMakefile( PREREQ_PM => { "Tk"  => '800.022' },
	       NAME => 'Tk::RemoteFileSelect',
	       VERSION_FROM => 'RemoteFileSelect.pm',
	       "dist"  => { COMPRESS  => "gzip -9f",
			    SUFFIZ    => ".gz"  } 
	       );
	      
WriteMakefile( PREREQ_PM => { "Tk"  => '800.022' },
	       NAME => 'Tk::Shell',
	       VERSION_FROM => 'Shell.pm',
	       "dist"  => { COMPRESS  => "gzip -9f",
			    SUFFIZ    => ".gz"  } 
	       );
WriteMakefile( PREREQ_PM => { "Tk"  => '800.022' },
	       NAME => 'Tk::SearchDialog',
	       VERSION_FROM => 'SearchDialog.pm',
	       "dist"  => { COMPRESS  => "gzip -9f",
			    SUFFIZ    => ".gz"  } 
	       );
WriteMakefile( PREREQ_PM => { "Tk"  => '800.022' },
	       NAME => 'Tk::WorkspaceText',
	       VERSION_FROM => 'WorkspaceText.pm',
	       "dist"  => { COMPRESS  => "gzip -9f",
			    SUFFIZ    => ".gz"  } 
	       );
WriteMakefile( PREREQ_PM => { "Tk"  => '800.022' },
	       NAME => 'Tk::Workspace',
	       VERSION_FROM => 'Workspace.pm',
	       "dist"  => { COMPRESS  => "gzip -9f",
			    SUFFIZ    => ".gz"  } 
	       );
