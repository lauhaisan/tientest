<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Web compare computer</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/heroic-features.css" rel="stylesheet">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">

                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <a class="navbar-brand" href="#">Home</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="home.jsp">Brand</a>
                        </li>
                        <li>
                           
                             <a href="compare.jsp">Compare</a>
                        </li>
                        <li>
                            <a href="contact.jsp">Contact us</a>
                        </li>
                        <li>
                            <a href="#" data-toggle="modal" data-target="#myModal">Register</a>

                        </li>
                        <li>
                            <button type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#loginPopup" 
                                    style="margin-left: 630px;margin-top: 8px ">Login</button>


                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>
        <form method="POST" action="homeBootstrap.jsp">
            <div id="loginPopup" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Login</h4>
                        </div>
                        <div class="modal-body" style="height: 150px;"> 
                            <div class="form-group"> 

                                <label class="control-label col-sm-2" for="email" style="margin-top: 5px">Account:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="email" placeholder="Enter account"></br>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="pwd">Password:</label>
                                <div class="col-sm-10"> 
                                    <input type="password" class="form-control" id="pwd" placeholder="Enter password"></br>
                                </div>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <a href="">Register </a>
                            <input type="submit" class="btn btn-default" value="Login"/>
                        </div>
                    </div>

                </div>
            </div>
            <div id="myModal" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Login</h4>
                        </div>
                        <div class="modal-body" style="height: 350px;"> 
                            <div class="form-group"> 

                                <label class="control-label col-sm-2" for="email" style="margin-top: 5px">Account:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="email" placeholder="Account must have above 6 character"></br>
                                </div>
                            </div>
                            <div class="form-group"> 

                                <label class="control-label col-sm-2" for="email" style="margin-top: 5px">Password:</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="email" placeholder="Enter password"></br>
                                </div>
                            </div>
                            <div class="form-group"> 

                                <label class="control-label col-sm-2" for="email" style="margin-top: 5px">Address:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="email" placeholder="Enter address"></br>
                                </div>
                            </div>
                            <div class="form-group"> 

                                <label class="control-label col-sm-2" for="email" style="margin-top: 5px">Phone:</label>
                                <div class="col-sm-10">
                                    <input type="number" class="form-control" id="email" placeholder="Phone(0~9) "></br>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="pwd">Password:</label>
                                <div class="col-sm-10"> 
                                    <input type="password" class="form-control" id="pwd" placeholder="Enter password"></br>
                                </div>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <a href="">Register </a>
                            <input type="submit" class="btn btn-default" value="Login"/>
                        </div>
                    </div>

                </div>
            </div>
        </form>
        <!-- Page Content -->
        <div class="container">

            <!-- Jumbotron Header -->
            <header class="jumbotron hero-spacer">
                <h1>A Warm Welcome!</h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsa, ipsam, eligendi, in quo sunt possimus non incidunt odit vero aliquid similique quaerat nam nobis illo aspernatur vitae fugiat numquam repellat.</p>
                <p><a class="btn btn-primary btn-large">Call to action!</a>
                </p>
            </header>

            <hr>

            <!-- Title -->
            <div class="row">
                <div class="col-lg-12">
                    <h3>Latest Features</h3>
                </div>
            </div>
            <!-- /.row -->

            <!-- Page Features -->
            <div class="row text-center">

                <div class="col-md-3 col-sm-6 hero-feature">
                    <div class="thumbnail">
                        <img src="http://placehold.it/800x500" alt="">
                        <div class="caption">
                            <h3>Feature Label</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                            <p>
                                <a href="#" class="btn btn-primary">Buy Now!</a> <a href="#" class="btn btn-default">More Info</a>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-md-3 col-sm-6 hero-feature">
                    <div class="thumbnail">
                        <img src="http://placehold.it/800x500" alt="">
                        <div class="caption">
                            <h3>Feature Label</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                            <p>
                                <a href="#" class="btn btn-primary">Buy Now!</a> <a href="#" class="btn btn-default">More Info</a>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-md-3 col-sm-6 hero-feature">
                    <div class="thumbnail">
                        <img src="http://placehold.it/800x500" alt="">
                        <div class="caption">
                            <h3>Feature Label</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                            <p>
                                <a href="#" class="btn btn-primary">Buy Now!</a> <a href="#" class="btn btn-default">More Info</a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 hero-feature">
                    <div class="thumbnail">
                        <img src="http://placehold.it/800x500" alt="">
                        <div class="caption">
                            <h3>Feature Label</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                            <p>
                                <a href="#" class="btn btn-primary">Buy Now!</a> <a href="#" class="btn btn-default">More Info</a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 hero-feature">
                    <div class="thumbnail">
                        <img src="http://placehold.it/800x500" alt="">
                        <div class="caption">
                            <h3>Feature Label</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                            <p>
                                <a href="#" class="btn btn-primary">Buy Now!</a> <a href="#" class="btn btn-default">More Info</a>
                            </p>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.row -->

            <hr>

            <!-- Footer -->
            <footer>
                <div class="row">
                    <div class="col-lg-12">
                        <p>Copyright &copy; Your Website 2014</p>
                    </div>
                </div>
            </footer>

        </div>
        <!-- /.container -->

        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

    </body>

</html>
