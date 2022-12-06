# dinsol-v1.0

The Daily INSOLationi (DINSOL-v1.0) is a program that simulates the incoming solar radiation at the top of the atmosphere following the Milankovitch cycles theory. The tool is ideal for preparing the boundary conditions of climate models, beyond to be a helpful tool for educational purposes. The program allows the user to simulate the solar radiation data using many input options, such as setting the number of points of latitude and longitude, the solar constant, a calendar of 365 or 360 days, or choosing between the most famous parameterizations for the Earth orbital parameters (EOP): Be78, Be90, and Laskar. The users can also set the EOP freely, simulating the solar radiation of hypothetical cases. Moreover, by adopting the graphical user interface (GUI), the users can run the tool intuitively and generate many windows containing the results individually. The most important advantage of adopting the DINSOL is to have many output data options. For instance, the program computes the instantaneous solar radiation globally, which considers the Earth's rotation's effect (time step in hours) on incoming solar radiation; this data represents the sunlight behavior realistically. Thus, the DINSOL is an excellent option for students, teachers, and researchers who need to perform some scientific study or wish to teach about solar radiation in different areas (e.g., climatology, geography, astronomy, geophysics, computing science, meteorology, and others).

Official DINSOL-v1.0 web page: http://labmet.univasf.edu.br/joomla/index.php/pesquisas/modelos-numericos

 ***************************************
 * INSTALLATION: EXTERNAL REQUIREMENTS 
 ***************************************

 The DINSOL program has a shell script in the main folder 
 to install all libraries and perform all needed tasks to 
 install the program on a Linux machine. The script is called 
 "configure.sh" and demand a root execution. Please note that
 this shell script was made to run on distros based on Debian, 
 such as Ubuntu, Mint, Elementary OS, etc. Besides that, to use
 this script in other Linux distributions, it's necessary to edit
 and adapt it.

 The DINSOL model requires the following external libraries:
 
 --------------------------------------------------
   - Make
   - Fortran 90 standard compiler
   - R-base (colorRamps and maps packages)
   - Shell script
   - Linux or Unix style system
   - Wine   
 --------------------------------------------------
  
 Note that only Make and Fortran 90 compiler installation, 
 already allow to running the DINSOL model without the 
 graphical interface. 
  
 Moreover, in order to plot and manipulate output files, 
 we suggest installing the following programs:  
 
 --------------------------------------------------
   - GrADS 2
   - CDO
 --------------------------------------------------

 The GrADS is a classical tool to visualize climate and weather data,
 whereas the CDO is a powerful tool for working with climate data.

 For instance, if the DINSOL users prefer to work with NetCDF data, 
 they just need to use the following command line:
 
 ----------------------------------------------------
 cdo -f nc import_binary my_data.ctl my_new_data.nc
 ----------------------------------------------------
 
 The ".ctl" is an extension file used as a descriptor file.

 ---------------------------------------------------------------------------- 
 ***********************************************
 * SUPPORTED COMPILERS AND OPERATING SYSTEM
 ***********************************************

 We built DINSOL on different Fortran compilers (PGI, Intel, and GNU) 
 and Unix/Linux-type systems (Ubuntu and Manjaro). However, we also 
 built the source code on Windows systems, where GCC and  MSYS were 
 necessary. Although we did not have installed DINSOL on the MacOS yet,
 the users should get a clean installation.

 ----------------------------------------------------------------------------
 ************** 
 * INPUT DATA 
 **************

 In the input directory are the data that enter the subroutines that 
 calculate the orbital parameters. These data were obtained and adapted
 for DINSOL from other programs. This data can be found from the links
 available below. Note that these data represent some distinguished 
 researchers' years of hard work. Therefore, cite these researchers' 
 work and the DINSOL developer.

    ----------------------------------------------------------
         Université catholique de Louvain (UCLouvain):

          Andre Berger, Michel Crucifix, Qiuzhen Yin.

        https://www.elic.ucl.ac.be/modx/index.php?id=83
   ----------------------------------------------------------

         Virtual Observatory (VO) Paris data center 
         Institut de Mécanique Céleste et de Calcul
         des Éphémérides "(IMCCE)

            Laskar, J; Robutel, P; Joutel, F; 
            Gastineau, M; Correia, ACM; Levrard, B.

     http://vo.imcce.fr/insola/earth/online/earth/earth.html
    ----------------------------------------------------------
    
 ---------------------------------------------------------------------------- 
 *********************** 
 * COMPILING THE MODEL 
 ***********************

 After installing the required libraries, the users must go into folder
 "source/" and type:
  
  -------------
   make dinsol
  -------------
 
 Then, It makes the binary file dinsol.exe. Now, the model is ready to
 run from command lines.
 
 ---------------------------------------------------------------------------- 
 *************** 
 * SIMULATIONS 
 ***************
 
 ***-> Command lines <-***
 
 In order to run the model, It only needs to type on the main directory:

  --------------
   ./dinsol.exe
  --------------
  
 and wait for the simulation to finish. Note that the command lines mode
 require only Make and Fortran compiler installation.


 ***-> Graphical User Interface (GUI) <-***
 
 If you installed all the libraries correctly, the model must run easily 
 from GUI mode. Note that the text format and layout can change on different 
 operational systems. However, it doesn't affect the simulations. 
 
 Thus, for open GUI window, you must type on terminal:

  --------------
   wine GUI.exe
  --------------
  
 Note that the GUI.exe file needs to read two files indicating the DINSOL
 folder path:
 
  -------------------------------------------------------------------------
   - pathdir1.txt ; For instance Z:\\home\\machine_name\\dinsol-v1.0_linux
   - pathdir2.txt ; For instance /home/machine_name/dinsol-v1.0_linux
  -------------------------------------------------------------------------

 Nevertheless, before executing the simulation, you must run the Shell 
 script "replace.sh". This script builds some simulations and uses his result
 files in GUI mode. The script is located in the folder "output/.0K", and
 you must execute the following:

  --------------
   ./replace.sh
  --------------
  
 Note: you will need to wait some minutes until the finish.
 
 After that, still in the same folder, we need to execute another script:
 "make_gui_plot.sh". That creates the gui_plot.R script with the correct directory path. Thus, we must execute it using:
 
  ------------------- 
  ./make_gui_plot.sh
  -------------------
 
 Well, these steps are needed to run and install the program manually.
 
 ----------------------------------------------------------------------------   
 *************** 
 *  NAMELIST   
 ***************
 
 YEAR  - The Year chosen by the user can be any integer number. Note: zero
         represents the present time, which is equivalent to the year 
         1950 CE in the Berger 78 parameterization. The user can adopt 
         any integer value for the variable Year, as long as it respects
         the range -249 through 21 [10^6 yr’s].

 S0    - Defines the value of the Solar Constant adopted in the simulation, 
         the default unit is [W/m^2]. Note: S0 must be within the range
         ]0:10^8[

 NY    - Determines the number of latitude points.
 
 NX    - Determines the number of longitude points. 

 NTIME - Determines the time interval within 1 day, given in hours or 
         minutes.

         1 – 6 hours [0h ; 6h ; 12h ; 18h]
         2 – 3 hours [0h ; 3h ; 6h ; 9h ; 12h; 15h ; 18h; 21h]
         3 – 1 hours [0h ; 1h ; 2h ; 3h ... 22h ; 23h]
         4 – 30 mn   [0h ; 0.5h ; 1.0h ; 1.5h ; 2.0h ... 23.0h ; 23.5h]
         5 – 15 mn   [0h ; 0.25h ; 0.5h ; 0.75h; 1.0h ... 23.5h ; 23.75h]

 CALENDAR - Defines the number of days in the year:

         1 – 365 dias
         2 – 360 dias
         
 ORBITAL - Defines the method for calculating the orbital parameters:

         1 - Berger (1978) is defined; accuracy of +/- 1 x 10^6 yr's.
         
         2 - Berger e Loutre (1991) is defined; accuracy of +/- 3 x 10^6 yr's.

         3 - Laskar et al (2004; 2011) is defined; accuracy of -249 x 10^6
             through +21 x 10^6 yr's.
             
         4 - User-defined is defined; the user can freely choose the values 
             of the orbital parameters, having only to respect the valid 
             ranges for Eccentricity, Obliquity and General Precession.

   ECC  - User can choose any value in the range [0:0.5]

   OBLQ - User can choose any value in the range [-90:90], the unit of 
          measurement is given in degrees.

   PRCS - User can choose any value in the range [0:360[, the unit of 
          measurement is given in degrees.
           
 ----------------------------------------------------------------------------   
 ******************** 
 *  OUTPUT RESULTS  
 ********************

 The result files are made on output folder:
 
    -------------------------------------------------
       - solar.radiation / solar.radiation.ctl
       - radiation / radiation.ctl
       - insolation.txt
       - summary.txt
    -------------------------------------------------    

 Note that some scripts are available to assist the users in analyzing the
 result files.
 
    ---------------------------------
        - get_dinsol_value.R
        - plot_dinsol.R
        - plot_global.R
        - plot_dinsol.gs
        - plot_radiation.gs
    ---------------------------------
 
 You must edit these templates in concordance with your interests. Note that
 ".gs" files are simple GrADS scripts.
 
 ----------------------------------------------------------------------------   

 ********************************************* 
 *  GO AHEAD AND USE/SHARE THE DINSOL MODEL  
 *********************************************

 We hope you enjoy the DINSOL model, and if you have any questions, please 
 send an email: emerson.oliveira@univasf.edu.br

 Good Luck! / Boa Sorte!

 Best regards,

 Ph.D. Emerson D. Oliveira
 
 Climatologist, 
 
 Laboratory of Meteorology (LabMet) (http://labmet.univasf.edu.br/)
 
 Federal University of Vale do São Francisco - UNIVASF (https://portais.univasf.edu.br/)


