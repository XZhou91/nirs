#include <stdio.h>
#include <math.h>
#include <mex.h>
double gradphi(double g[3][2], double kappa[3], double val[3][3]);
double phidotphi(double g[3][2], double mua[3], double val[3][3]);
double boundary_int(double g[3][2], double bnd_index[3],	\
double ksir[3], double valr[2][2]);
double bound2(double g[2][2], int il, int im, double ksir[2], double *val);

/* -------- Heart of the mex file----------- */
void mainloop(double *nodes,
double *elements,
double *bndvtx,
double *mua,
double *mus,
double *g,
double *f1,
double *c,
double *omega,
int nodem,
int noden,
int elemm,
int elemn,
double *I,
double *J,
double *K1,
double *C,
double *B,
double *F1,
double *X,
double *Y
)

{
  int ele, i, j, index[3], k,b;
  double indextmp, tri_vtx[3][2];
  double bnd_index[3], kappa1_index[3];
  double mus_index[3], g_index[3];
  double c_index[3], mua_index[3];
  double k1_val[3][3], c_val[3][3];
  double f1_index[3],b_val[3][3];
  double f1_valr[2][2];
   
  k = 0;
  for (ele=0; ele<elemm; ++ele){
      for (i=0; i<elemn; ++i){
          indextmp = *(elements+(ele+(i*elemm)));
          index[i] = indextmp;
      }
      
      for (i=0; i<elemn; ++i){
          mua_index[i] = *(mua+(index[i]-1));
          mus_index[i] = *(mus+(index[i]-1));
          g_index[i] = *(g+(index[i]-1));
          kappa1_index[i] = (1./(3.*((mua_index[i]+mus_index[i])-(mus_index[i]*g_index[i]))));
          c_index[i] = *omega / *(c+(index[i]-1)) * -1;
          
	  /*     mexPrintf("%g %g %g\n",mua_index[0],mua_index[1],mua_index[2]);
	  /*mexPrintf("%g %g %g\n",kappa3_index[0],kappa3_index[1],kappa3_index[2]);*/
 /*
  * mesh.kappa1 = 1./(3*mesh.mua1);
  * mesh.mua1=(mesh.mua+mesh.mus)-(mesh.mus.*mesh.g);
      kappa3_index[i] = *(kappa3+(index[i]-1));*/
           
            
        for (j=0; j<noden; ++j){
           tri_vtx[i][j] = *(nodes+(index[i]-1+(j*nodem)));
        }
          
      }
        
     gradphi(tri_vtx,kappa1_index,k1_val);
     phidotphi(tri_vtx,mua_index,c_val);
     phidotphi(tri_vtx,c_index,b_val);
        
     /*    mexPrintf("%g %g %g\n %g %g %g\n %g %g %g\n", 
		 c_val[0][0], c_val[0][1],c_val[0][2],\
		 c_val[1][0], c_val[1][1],c_val[1][2],\
		 c_val[2][0], c_val[2][1],c_val[2][2]);*/
       
        
    /*mexPrintf("%g %g %g\n",kappa1_index[0],kappa1_index[1],kappa1_index[2]);*/
      for (i=0; i<3; ++i){
          for (j=0; j<3; ++j){
              I[k] = index[i];
              J[k] = index[j];
              K1[k] = k1_val[j][i];
              C[k] = c_val[j][i];
              B[k]= b_val[j][i];
              ++k;
          }
      }
  }

  k = 0;
  for (ele=0; ele<elemm; ++ele){
      for (i=0; i<elemn; ++i){
          indextmp = *(elements+(ele+(i*elemm)));
          index[i] = indextmp;
      }
      for (i=0; i<elemn; ++i){
          bnd_index[i] = *(bndvtx+(index[i]-1));
          f1_index[i] = *(f1+(index[i]-1));
   /*            g1_index[i] = *(g1+(index[i]-1));*/
            
          for (j=0; j<noden; ++j){
              tri_vtx[i][j] = *(nodes+(index[i]-1+(j*nodem)));
          }
      }
      if (bnd_index[0]+bnd_index[1]+bnd_index[2] != 0){
           
          boundary_int(tri_vtx, bnd_index, f1_index, f1_valr);
   /*            boundary_int(tri_vtx, bnd_index, g1_index, g1_valr);*/
            /*mexPrintf("%g %g\n",f1_index[0],f1_valr);*/
            
          if (bnd_index[0]==1 && bnd_index[2]==1){
              int index1[2];
              index1[0] = index[0];
              index1[1] = index[2];
              for (i=0; i<2; ++i){
                  for (j=0; j<=i; ++j){
                      X[k] = index1[i];
                      Y[k] = index1[j];
                      F1[k] = f1_valr[i][j];
/*                    G1[k] = g1_valr[i][j];*/
                      ++k;
                  }
              }
          }
          else if (bnd_index[0]==1 && bnd_index[1]==1){
              int index1[2];
              index1[0] = index[0];
              index1[1] = index[1];
              for (i=0; i<2; ++i){
                  for (j=0; j<=i; ++j){
                      X[k] = index1[i];
                      Y[k] = index1[j];
                      F1[k] = f1_valr[i][j];
	/*  G1[k] = g1_valr[i][j];*/
                        ++k;
                  }
              }
          }
          else if (bnd_index[1]==1 && bnd_index[2]==1){
              int index1[2];
              index1[0] = index[1];
              index1[1] = index[2];
              for (i=0; i<2; ++i){
                  for (j=0; j<=i; ++j){
                      X[k] = index1[i];
                      Y[k] = index1[j];
                      F1[k] = f1_valr[i][j];
/*                    G1[k] = g1_valr[i][j];*/
                      ++k;
                  }
              }
          }   
      }
  }

return;
}
double gradphi(double g[3][2], double kappa[3], double val[3][3])
{
    int ii, jj;
    static int L[2][3] = {{-1.0,1.0,0.0}, \
{-1.0,0.0,1.0}};
static double w[3] = {1.0/6.0,1.0/6.0,1.0/6.0};
static double ip[3][2] = {{1.0/2.0,0.0},{1.0/2.0,1.0/2.0},{0.0,1.0/2.0}};
double Jt[2][2], dJt, iJt[2][2], S[3], G[2][3], GG[3][3], tmp;
double x0 = g[0][0]; double x1 = g[1][0];
double x2 = g[2][0];
double y0 = g[0][1]; double y1 = g[1][1];
double y2 = g[2][1];
double k0 = kappa[0]; double k1 = kappa[1];
double k2 = kappa[2];

Jt[0][0] = L[0][0]*x0 + L[0][1]*x1 + L[0][2]*x2;
Jt[0][1] = L[0][0]*y0 + L[0][1]*y1 + L[0][2]*y2;
Jt[1][0] = L[1][0]*x0 + L[1][1]*x1 + L[1][2]*x2;
Jt[1][1] = L[1][0]*y0 + L[1][1]*y1 + L[1][2]*y2;

dJt = (Jt[0][0]*Jt[1][1]) - (Jt[0][1]*Jt[1][0]);

iJt[0][0] = +(Jt[1][1])/dJt;
iJt[0][1] = -(Jt[0][1])/dJt;
iJt[1][0] = -(Jt[1][0])/dJt;
iJt[1][1] = +(Jt[0][0])/dJt;

dJt = sqrt(dJt*dJt);

G[0][0] = iJt[0][0]*L[0][0] + iJt[0][1]*L[1][0];
G[0][1] = iJt[0][0]*L[0][1] + iJt[0][1]*L[1][1];
G[0][2] = iJt[0][0]*L[0][2] + iJt[0][1]*L[1][2];
G[1][0] = iJt[1][0]*L[0][0] + iJt[1][1]*L[1][0];
G[1][1] = iJt[1][0]*L[0][1] + iJt[1][1]*L[1][1];
G[1][2] = iJt[1][0]*L[0][2] + iJt[1][1]*L[1][2];

GG[0][0] = G[0][0]*G[0][0] + G[1][0]*G[1][0];
GG[0][1] = G[0][0]*G[0][1] + G[1][0]*G[1][1];
GG[0][2] = G[0][0]*G[0][2] + G[1][0]*G[1][2];
GG[1][0] = G[0][1]*G[0][0] + G[1][1]*G[1][0];
GG[1][1] = G[0][1]*G[0][1] + G[1][1]*G[1][1];
GG[1][2] = G[0][1]*G[0][2] + G[1][1]*G[1][2];
GG[2][0] = G[0][2]*G[0][0] + G[1][2]*G[1][0];
GG[2][1] = G[0][2]*G[0][1] + G[1][2]*G[1][1];
GG[2][2] = G[0][2]*G[0][2] + G[1][2]*G[1][2];

for (ii=0; ii<3; ++ii){
    for (jj=0; jj<3; ++jj){
        val[ii][jj]=0;
    }
}

for (ii=0; ii<3; ++ii){
    S[0] = 1-ip[ii][0]-ip[ii][1];
    S[1] = ip[ii][0];
    S[2] = ip[ii][1];
    tmp = k0*S[0] + k1*S[1] + k2*S[2];
    tmp = tmp*w[ii];
    val[0][0] += GG[0][0]*tmp;
    val[0][1] += GG[1][0]*tmp;
    val[0][2] += GG[2][0]*tmp;
    val[1][0] += GG[0][1]*tmp;
    val[1][1] += GG[1][1]*tmp;
    val[1][2] += GG[2][1]*tmp;
    val[2][0] += GG[0][2]*tmp;
    val[2][1] += GG[1][2]*tmp;
    val[2][2] += GG[2][2]*tmp;
}
for (ii=0; ii<3; ++ii){
    for (jj=0; jj<3; ++jj){
        val[ii][jj] = val[ii][jj]*dJt;
    }
}

return;
}
double phidotphi(double g[3][2], double mua[3], double val[3][3])
{
    int ii, jj;
    static int L[2][3] = {{-1.0,1.0,0.0}, \
{-1.0,0.0,1.0}};
static double w[3] = {1.0/6.0,1.0/6.0,1.0/6.0};
static double ip[3][2] = {{1.0/2.0,0.0},{1.0/2.0,1.0/2.0},{0.0,1.0/2.0}};
double Jt[2][2], dJt, S[3], tmp;
double x0 = g[0][0]; double x1 = g[1][0];
double x2 = g[2][0];
double y0 = g[0][1]; double y1 = g[1][1];
double y2 = g[2][1];
double k0 = mua[0]; double k1 = mua[1];
double k2 = mua[2];

Jt[0][0] = L[0][0]*x0 + L[0][1]*x1 + L[0][2]*x2;
Jt[0][1] = L[0][0]*y0 + L[0][1]*y1 + L[0][2]*y2;
Jt[1][0] = L[1][0]*x0 + L[1][1]*x1 + L[1][2]*x2;
Jt[1][1] = L[1][0]*y0 + L[1][1]*y1 + L[1][2]*y2;

dJt = (Jt[0][0]*Jt[1][1]) - (Jt[0][1]*Jt[1][0]);

dJt = sqrt(dJt*dJt);

for (ii=0; ii<3; ++ii){
    for (jj=0; jj<3; ++jj){
        val[ii][jj]=0;
    }
}

for (ii=0; ii<3; ++ii){
    S[0] = 1-ip[ii][0]-ip[ii][1];
    S[1] = ip[ii][0];
    S[2] = ip[ii][1];
    tmp = k0*S[0] + k1*S[1] + k2*S[2];
    tmp = tmp*w[ii];
    val[0][0] += S[0]*S[0]*tmp;
    val[0][1] += S[1]*S[0]*tmp;
    val[0][2] += S[2]*S[0]*tmp;
    val[1][0] += S[0]*S[1]*tmp;
    val[1][1] += S[1]*S[1]*tmp;
    val[1][2] += S[2]*S[1]*tmp;
    val[2][0] += S[0]*S[2]*tmp;
    val[2][1] += S[1]*S[2]*tmp;
    val[2][2] += S[2]*S[2]*tmp;
}
for (ii=0; ii<3; ++ii){
    for (jj=0; jj<3; ++jj){
        val[ii][jj] = val[ii][jj]*dJt;
    }
}
return;
}


double boundary_int(double gg[3][2], double bnd_index[3], double ksir[3], \
double valr[2][2])
{
    double ksirtmp[2];
    int i, j;
    double g[2][2], val;
    
    for (i=0; i<2; ++i){
        for (j=0; j<2; ++j){
            valr[i][j]=0;
        }
    }
    
    if (bnd_index[0]==1 && bnd_index[2]==1){
        ksirtmp[0] = ksir[0];
        ksirtmp[1] = ksir[2];
        g[0][0] = gg[0][0];
        g[0][1] = gg[0][1];
        g[1][0] = gg[2][0];
        g[1][1] = gg[2][1];
        for (i=0; i<2; ++i){
            for (j=0; j<=i; ++j){
                bound2(g, i, j, ksirtmp, &val);
                valr[i][j] = val;
            }
        }
    }
    else if (bnd_index[0]==1 && bnd_index[1]==1){
        ksirtmp[0] = ksir[0];
        ksirtmp[1] = ksir[1];
        g[0][0] = gg[0][0];
        g[0][1] = gg[0][1];
        g[1][0] = gg[1][0];
        g[1][1] = gg[1][1];
        
        for (i=0; i<2; ++i){
            for (j=0; j<=i; ++j){
                bound2(g, i, j, ksirtmp, &val);
                valr[i][j] = val;
            }
        }
    }
    else if (bnd_index[1]==1 && bnd_index[2]==1){
        ksirtmp[0] = ksir[1];
        ksirtmp[1] = ksir[2];
        g[0][0] = gg[1][0];
        g[0][1] = gg[1][1];
        g[1][0] = gg[2][0];
        g[1][1] = gg[2][1];
        
        for (i=0; i<2; ++i){
            for (j=0; j<=i; ++j){
                bound2(g, i, j, ksirtmp, &val);
                valr[i][j] = val;
            }
        }
    }
    return;
}
double bound2(double g[2][2], int il, int im, double ksir[2], \
double *val)
{
    static double w[2] = {1.0/2.0,1.0/2.0};
    static double ip[2] = {0.21132486540519,0.78867513459481};
    double dJt, S[2], tmp, tmpval;
    int ii;
    double x0 = g[0][0]; double x1 = g[1][0];
    double y0 = g[0][1]; double y1 = g[1][1];
    double k0 = ksir[0]; double k1 = ksir[1];
    
    dJt = sqrt(((g[1][0]-g[0][0])*(g[1][0]-g[0][0])) +	\
    ((g[1][1]-g[0][1])*(g[1][1]-g[0][1])));
    
    
    tmpval = 0.0;
    for (ii=0; ii<2; ++ii){
        S[0] = 1-ip[ii];
        S[1] = ip[ii];
        tmp = k0*S[0] + k1*S[1];
        tmp = tmp*w[ii];
        tmpval += S[il]*S[im]*tmp;
    }
    *val = tmpval*dJt;
}
/* -------- Gate-way to matlab  ------------ */

void mexFunction(int nlhs,
mxArray *plhs[],
int nrhs,
const mxArray *prhs[])

{
    double *nodes,*elements,*bndvtx,*mua, *mus, *g;
    double *f1,*g1,*c,*omega;
    int nodem,noden,elemm,elemn,nzmax;
    double *I,*J,*K1, *C, *B, *X, *Y;
    double *F1, *G1;
    
  /* Error checking  */
    
    if (nrhs < 9 )
        mexErrMsgTxt(" There are not enough input arguments");
    
    if(nlhs!=8)
        mexErrMsgTxt("This routine requires 8 ouput arguments");
    
    nodes=mxGetPr(prhs[0]);       /* nodes of mesh */
    elements=mxGetPr(prhs[1]);    /* elements of mesh */
    bndvtx=mxGetPr(prhs[2]);      /* boundary nodes */
    mua=mxGetPr(prhs[3]);         /* absorption */
    mus=mxGetPr(prhs[4]);	  /* scattering*/
    g=mxGetPr(prhs[5]);	  	  /* anisotropy */
    f1=mxGetPr(prhs[6]);          /* reflection  */
    c=mxGetPr(prhs[7]);           /* speed of light */
    omega=mxGetPr(prhs[8]);       /* frequency of excitation */
    
    
    nodem=mxGetM(prhs[0]);      /* Number of of nodes */
    noden=mxGetN(prhs[0]);      /* Number of node freedom */
    elemm=mxGetM(prhs[1]);      /* Number of elements */
    elemn=mxGetN(prhs[1]);      /* Number of nodes per elements */
    
   nzmax = elemm*(elemn*(elemn+1));
  /*mexPrintf("%d\n",nzmax);*/
    
    plhs[0]=mxCreateDoubleMatrix(nzmax,1,mxREAL);    /* i */
    plhs[1]=mxCreateDoubleMatrix(nzmax,1,mxREAL);    /* j */
    plhs[2]=mxCreateDoubleMatrix(nzmax,1,mxREAL);    /* K1 */
    plhs[3]=mxCreateDoubleMatrix(nzmax,1,mxREAL);    /*C*/
    plhs[4]=mxCreateDoubleMatrix(nzmax,1,mxCOMPLEX); /*B*/
    plhs[5]=mxCreateDoubleMatrix(nzmax,1,mxREAL);    /*F1*/
    plhs[6]=mxCreateDoubleMatrix(nzmax,1,mxREAL);    /*x*/
    plhs[7]=mxCreateDoubleMatrix(nzmax,1,mxREAL);    /*y*/
  
    
    I=mxGetPr(plhs[0]);
    J=mxGetPr(plhs[1]);
    K1=mxGetPr(plhs[2]);
    C=mxGetPr(plhs[3]);
    B=mxGetPi(plhs[4]);
    F1=mxGetPr(plhs[5]);
    X=mxGetPr(plhs[6]);
    Y=mxGetPr(plhs[7]);
    
    mainloop(nodes,elements,bndvtx,mua,mus,g,f1,c,omega,nodem,noden,elemm,elemn,I,J,K1,C,B,F1,X,Y);
    
    return;
}

