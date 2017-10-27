$(document).ready(function() {
	$('#menuDataTables').DataTable( {
	    serverSide: true,
	    ajax: {
	        url: '/data-source',
	        type: 'POST'
	    }
	} );
});

