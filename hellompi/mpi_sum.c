#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <mpi.h>

int main(int argc, char *argv[])
{
    clock_t start, end;
    int num_sample,i,count,count_sum;
    double mypi, x, y;

    int nprocs, myrank;
    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
    MPI_Comm_rank(MPI_COMM_WORLD, &myrank);

    printf("I'm alive! :%d\n",myrank);
    num_sample = 100000;

    start = clock();



    for(int j=0;j<10000000;j++)
    {
    count=0;
    for(i=myrank+1;i<=num_sample;i+=nprocs)
    {
        count += i;
    }
    }

    MPI_Reduce(&count,&count_sum,1,MPI_INT,MPI_SUM,0,MPI_COMM_WORLD);
    end = clock();

    if(num_sample != 0)
    {
        if(myrank == 0)
        {
            mypi = (double)count_sum;
            printf("Output : %.20f\n",mypi);
            printf("Elapsed time = %f[sec]\n",(double)(end-start)/CLOCKS_PER_SEC);
        }
    }

    MPI_Finalize();
    return 0;
}
