use ExtUtils::MakeMaker;
WriteMakefile(
    'NAME'		=> 'Rcs::Parser',
    'VERSION_FROM'	=> 'lib/Rcs/Parser.pm', 
    'PREREQ_PM'		=> { 'Sort::Versions' => 0, 'Test::Simple' => 0 }, 
    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM => 'lib/Rcs/Parser.pm', # retrieve abstract from module
       AUTHOR     => 'Phil Pollard <bennie@cpan.org>') : ()),
);
