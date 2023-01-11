import java.util.Arrays;

class networkobj{
  private int inlayer = 5;
  private int outlayer = 5;
  private int intlayers = 3;
  private int[] layerdepth;
  private double[][][] axons;
  private double[][] neurons;
  private double input[];
  private double output[];
  private double bounding = 0;

  public networkobj(int a,int b,int c){                               //constructor initializing a nn with random axon weights
     inlayer = a;
     outlayer = b;
     output = new double[outlayer];
     intlayers = c;
     layerdepth = new int[] {(inlayer),5,5,5,(outlayer)};
     axons = new double[5][5][intlayers+1];
     neurons = new double[intlayers + 2][inlayer];
     genAxons();
  }


  public networkobj(int a,int b,int c,double[][][] izit){                //constructor initializing a nn with input axon weights
     inlayer = a;
     outlayer = b;
     output = new double[outlayer];
     intlayers = c;
     layerdepth = new int[] {(inlayer),5,5,5,(outlayer)};
     axons = izit;
     neurons = new double[intlayers + 2][inlayer];
  }

  public networkobj(int a,int b,int c,double[][][] izit,double mutie){                //constructor initializing a nn with input axon weights
     inlayer = a;
     outlayer = b;
     output = new double[outlayer];
     intlayers = c;
     layerdepth = new int[] {(inlayer),5,5,5,(outlayer)};
     axons = izit.clone();
     neurons = new double[intlayers + 2][inlayer];
     inheritAxons(mutie);
  }

  public double[] passthroughnet(double[] inputp){
      for (int h = 0; h < (intlayers+1); h++){
        sInputInArr(inputp);

        for(int i =0; i < layerdepth[h+1]; i++){                      //calculating pass through layer
          //System.out.print("\noutput fill"+ i + ":0 ");
          for(int j =0; j < layerdepth[h]; j++){
            neurons[h+1][i] += (axons[j][i][h]) * neurons[h][j];
            //System.out.print("(" + axons[j][i][h] + ")" +"->"+neurons[h+1][i]);
          }; 
          //System.out.print(neurons[h+1][i]);
          //System.out.print("\n");
          //neurons[h+1][i] /= layerdepth[h];
        };

      };
      //System.out.println(" " + output + " "); 
      rectout();
      clearneurons();
      //printout();
      return output;
  }

  public void rectout(){                                //using a semi-sigmoid function to make network more decisive
    for(int ret = 0; ret < layerdepth[4]; ret++){
      if(neurons[intlayers+1][ret] > 0.5){
        output[ret] = (1+Math.pow(2*(neurons[intlayers+1][ret])-1,0.33))/2;
      }else{
        output[ret] = 1-(1+Math.pow(-2*(neurons[intlayers+1][ret])+1,0.33))/2;
      };
    }
  }

  public void printout(){
    for(int i =0; i< output.length; i++){
      System.out.println(output[i]);
    }
  }
  
  public void genAxons(){                               //for now, used to create axons with random weight
     for (int k = 0; k < (intlayers+1); k++){
      for (int l = 0; l < outlayer; l++){
        for (int m = 0; m < inlayer; m++){
          axons[m][l][k] = (double)Math.random();
          //System.out.print("" + axons[m][l][k]+ "_");
        };
        //System.out.println("+ ");
      };
      //System.out.println("+");
    };
    //System.out.println("done ");
  };

  public void sInputInArr(double[] inputj){
    for(int q = 0; q < inputj.length; q++){              //temp input into neuron array for through cycle
      neurons[0][q] = inputj[q];
    };
  }

  public void clearneurons(){                            //clearing neuron charge value for a new passthrough of the network
    for(int i = 0; i <neurons.length; i++){
      for(int j =0; j < neurons[4].length; j++){
        neurons[i][j] = 0;
      }
    }
  }

  public double[][][] getaxon(){                         // for giving axon value for out of class calls for later reference
    return axons.clone();
  }

  public void enterAxon(double[][][] nat){               //to try to input axons
    axons = nat.clone();
  }


  public void inheritAxons(double mutation){             //used to create child network, inheriting axons and mutations from parent
     for (int k = 0; k < (intlayers+1); k++){
      for (int l = 0; l < outlayer; l++){
        for (int m = 0; m < inlayer; m++){
          axons[m][l][k] += (Math.random()*mutation*2) - mutation;
          //System.out.print("|"+((Math.random()*mutation*2) - mutation) + ":");
          //System.out.print("" + axons[m][l][k]+ "_");
        };
        //System.out.println("+ ");
      };
      //System.out.println("+ ");
    };
    //System.out.println("done ");
  };
}
