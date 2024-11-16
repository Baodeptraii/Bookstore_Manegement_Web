<style>
    /* Custom Colors */
    .bg-custom {
        background-color: #ff7043; /* Orange */
    }

    /* Navbar Styles */
    .navbar {
        padding: 8px 0;
        position: sticky; /* Sticky position */
        top: 0; /* Stick to the top */
        z-index: 1000; /* Ensure it stays above other content */
        background-color: #ff7043; /* Match navbar background to the top bar */
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    /* Admin Greeting */
    .user-greeting {
        font-size: 1.2rem;
        font-weight: bold;
        color: #333;
    }

    .user-greeting i {
        margin-right: 10px;
    }



</style>


<div class = "container-fluid highlight-bar" style="height: 10px; background-color: #ff7043;"></div>

<div class="container-fluid p-3 bg-light">
    <div class="row">
        <div class="col-md-3">
            <h3>  My Bookstore</h3>
        </div>
        <div class="col-md-6">
    <div class="col-md-6">
                       <form class="form-inline" action="search.jsp" method="post">
                           <input class="form-control mr-sm-2 w-75" type="search" placeholder="Search orders" aria-label="Search" name="search">
                           <button class="btn btn-primary" type="submit">
                               <i class="fa-solid fa-magnifying-glass"></i> Search
                           </button>
                       </form>
                   </div>
        </div>

       <div class="col-md-3 d-flex align-items-center">
           <i class="fa-solid fa-user-tie fa-2x" style="color: #000000; margin-right: 10px;"></i>
           <h3>   Hi, Admin</h3>
       </div>





    </div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">

    <a class="navbar-brand" href="#"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>



   <div class="collapse navbar-collapse" id="navbarSupportedContent">
       <!-- Left-aligned links -->
       <ul class="navbar-nav mr-auto">
           <li class="nav-item active">
               <a class="nav-link" href="home.jsp"><i class="fa-solid fa-house"></i> Home <span class="sr-only">(current)</span></a>
           </li>
       </ul>

       <!-- Right-aligned logout link -->
       <ul class="navbar-nav ms-auto mr-3">
           <li class="nav-item active">
               <a class="nav-link" href="../LogoutServlet"><i class="fa-solid fa-right-from-bracket"></i> Logout <span class="sr-only">(current)</span></a>
           </li>
       </ul>
   </div>

</nav>