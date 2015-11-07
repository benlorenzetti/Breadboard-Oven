// generate-iso-projection.c

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define LINE_SIZE	1000

typedef enum
{
	LINE,
	CIRCLE
} command_t;

typedef enum
{
	NONE,
	RADIUS
} option_t;

char* project_3D_to_2D (char*, int);

int main (int argc, char *argv[])
{
	command_t active_command;
	option_t active_option = NONE;
	int this_char;
	char this_line[LINE_SIZE];	
	int line_size;	

	// Get Input Script Filename from Command Line Parameter
	if (argc != 2) {
		printf ("Usage: %s 3D-Script-Filename\n", argv[0]);
		exit (EXIT_FAILURE);
	}
	// Open Input and Output Files
	FILE* fin = fopen (argv[1], "r");
	if (!fin) {
		printf ("Could not open file %s\n", argv[0]);
		exit (EXIT_FAILURE);
	}
	FILE* fout = fopen ("output.scr", "w");
	if (!fout) {
		printf ("Could not open file output.scr\n");
		exit (EXIT_FAILURE);
	}

	while (!feof(fin)) {
		// Read Next Line -> this_line[]
		line_size = 0;
		this_char = fgetc (fin);
		do {
			if (this_char == EOF)
				break;
			if (this_char == '\r')
				this_line[line_size] = 0; // handle nonlinux CRs
			this_line[line_size++] = (char) this_char;		
			this_char = fgetc (fin);
		} while (this_char != '\n' && line_size < LINE_SIZE);
			this_line[line_size] = 0;

		// Compare to List of Known Commands
		if (!strcmp (this_line, "LINE")) {
			active_command = LINE;
			fprintf (fout, "LINE\n");
		}
		else if (!strcmp (this_line, "CIRCLE")) {
			active_command = CIRCLE;
			fprintf (fout, "CIRCLE\n");
		}

		// Compare to List of Known Options
		else if ((active_command == CIRCLE) && (!strcmp (this_line, "R"))) {
			active_option = RADIUS;	// short circuiting comparision
			fprintf (fout, "R\n");
		}
		else if ((active_command == CIRCLE) && (active_option == RADIUS)) {
			fprintf (fout, "%s\n", this_line);
			active_option = NONE;
		}

		// Check for Digit; i.e. command parameters
		else if (('0' <= this_line[0]) && (this_line[0] <= '9')) {
			fprintf (fout, "%s", project_3D_to_2D (this_line, line_size));
		}
	}
	// Close both files and exit
	fclose (fout);
	fclose (fin);				
}

char* project_3D_to_2D (char* src, int src_size) {
	int dimension = 0;
	double threeD_space[3] = {0, 0, 0};
	double twoD_space[2] = {0, 0};
	char* iter;

	// Read src string "x,y,z" and convert to x, y, and z double values
	for (iter = src; iter < (src + src_size); iter++) {
		if (!(*iter))
			break;
		else if (*iter == ',')
			dimension++;
		else {
			threeD_space[dimension] *= 10;
			threeD_space[dimension] += (*iter) - '0';
		}
	}
	// Do projection mathematics
	twoD_space[0] = sqrt(3) * 0.5 * (threeD_space[0] + threeD_space[2]);
	twoD_space[1] = threeD_space[1] + (threeD_space[2] - threeD_space[0]) / 2;
	// Write result back to src and return
	sprintf (src, "%5.5f,%5.5f\n", twoD_space[0], twoD_space[1]);
	return src;
}
	
