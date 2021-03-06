#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *contents( char *filename, int *len )
{
        FILE *file = fopen( filename, "r" );

        if( file == NULL )
        {
                return "";
        }

        fseek( file, 0, SEEK_END );
        *len = ftell( file );

        fseek( file, 0, SEEK_SET );

        char *contents = malloc( *len * sizeof( char ) + 1 );
        fread( contents, *len, 1, file );

        contents[ *len ] = '\0';

        fclose( file );

        return contents;
}

char *memnchr( char *haystack, char needle, int len )
{
	for( int i = 0; i < len; i++ )
	{
		if( haystack[ i ] == needle )
		{
			return haystack + i + 1;
		}
	}

	return NULL;
}

int main()
{
	int len;
	char *data = contents( "./items/items.bin", &len );

	// get rid of the damn \n vim insists on adding...
	data[ len - 1 ] = '\0';

	int id = 0;
	char *currName = data;

	//printf( "[" );

	while( 1 )
	{
		// this is cheating
		if( strcmp( currName, "No Bottle" ) == 0 )
		{
			id++;
			currName = memnchr( currName, '\0', len );

			continue;
		}

		//printf( "\n\t{\n\t\t\"id\" : %d,\n\t\t\"name\" : {\n\t\t\t\"hgg\" : \"%s\"\n\t\t}\n\t}", id, currName );
		printf( "%d %s", id, currName );

		char *nextName = memnchr( currName, '\0', len );

		if( *nextName == NULL )
		{
			break;
		}

		printf( "\n\n" );

		id++;
		currName = nextName;
	}

	//printf( "\n]\n" );

	return EXIT_SUCCESS;
}
