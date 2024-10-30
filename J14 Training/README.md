# Training and Results for J14 Potential

This section presents the training process and results using the **J14 Potential** dataset. The goal of the project is to optimize the force loss by training with **NEP4 (Neuroevolution Potential)**. 

The input parameters used in this training can be referenced [here](https://gpumd.org/nep/input_files/nep_in.html#index-0).

---

## Default Parameters and Initial Loss

We begin by configuring the default parameters to establish a baseline for the force loss. These parameters are critical for controlling the complexity and accuracy of the potential model.

### **Default Setup:**
Below is the default configuration for the parameters used in the initial run:

- **`nmax`**: Maximum radial quantum number  
- **`basis_size`**: The number of basis functions used  
- **`l_max`**: Maximum angular momentum  
- **`neurons`**: Number of neurons in the neural network  
- **`batch`**: Batch size used in each iteration  

![Default Setup](./images/default_setup.png)

### **Default Loss:**
The force loss calculated using the default parameters is shown in the graph below. This serves as the baseline for comparison in subsequent optimization steps.

![Default Loss](./images/default_loss.png)

---

## Phase 1: Minimizing the Loss for Individual Parameters

Our primary objective is to minimize the force loss by systematically adjusting each parameter to determine the optimal configuration.

### **Approach to Minimizing Loss:**
- **Parameter tuning**: For each parameter (`nmax`, `basis_size`, `l_max`, `neurons`, and `batch`), we experiment with a range of values to find the setup that yields the smallest force loss.
- **Loss evaluation strategy**:
  - **MIN Strategy**: Take the **minimum** value from the last 10 rows of the loss output and compare it to the default setup's loss.
  - **AVG Strategy**: Compute the **average** value from the last 10 rows of the loss output for comparison.

- **Optimization Objective**: 
  - Identify the optimal combination for each hyperparameter.
  - Report the **mean improvement** and **average gain** in the loss compared to the default configuration.

---

## Optimized Parameter Configurations and Results

### **1. Optimized Neurons Setup**

We tested several neuron configurations, adjusting the number of layers and neurons per layer. The most effective configuration was **60 neurons in a single layer**, which resulted in a significant reduction in force loss.

![Neuron Force Loss](./images/neuron_force_loss.png)

- **Best Configuration**:  
  - 1 Layer  
  - 60 Neurons

- **Loss Analysis**:
  - **MIN** of the last 10 rows: X (Compared to Default: Y)  
  - **AVG** of the last 10 rows: X (Compared to Default: Y)

---

### **2. Optimized Basis Setup**

We experimented with different **basis sizes** to find the most effective setup. The optimal basis size was determined to be **4-8**, providing a balance between accuracy and computational efficiency.

![Basis Force Loss](./images/basis_force_loss.png)

- **Best Configuration**:  
  - **Basis Size**: 4-8

- **Loss Analysis**:
  - **MIN** of the last 10 rows: X (Compared to Default: Y)  
  - **AVG** of the last 10 rows: X (Compared to Default: Y)

---

### **3. Optimized L_max Setup**

The **angular momentum cutoff (`l_max`)** controls how well the potential model captures angular interactions. Testing several configurations, we found that the best-performing setup was **4-2-1**.

![Lmax Force Loss](./images/lmax_loss.png)

- **Best Configuration**:  
  - **l_max**: 4-2-1

- **Loss Analysis**:
  - **MIN** of the last 10 rows: X (Compared to Default: Y)  
  - **AVG** of the last 10 rows: X (Compared to Default: Y)

---

### **4. Optimized Batch Setup**

Batch size affects both convergence speed and loss behavior. After experimenting with several batch sizes, the optimal size was found to be **2000**, which provided the best reduction in loss without compromising the stability of the training.

![Batch Force Loss](./images/batch_force_loss.png)

- **Best Configuration**:  
  - **Batch Size**: 2000

- **Loss Analysis**:
  - **MIN** of the last 10 rows: X (Compared to Default: Y)  
  - **AVG** of the last 10 rows: X (Compared to Default: Y)

---

## Summary and Future Work

This optimization process allowed us to systematically minimize the force loss of the J14 potential by tuning key parameters such as neurons, basis size, angular momentum (`l_max`), and batch size. Below are the key takeaways:

- **Neurons**: 60 neurons in a single layer provided the lowest loss.
- **Basis Size**: 4-8 emerged as the most effective basis setup.
- **l_max**: The 4-2-1 configuration captured angular interactions optimally.
- **Batch Size**: A batch size of 2000 balanced speed and stability.

### **Next Steps:**
- Combine the optimized values for all parameters into a final model.
- Perform **Molecular Dynamics (MD) simulations** using the optimized model.
- Analyze the thermal conductivity results and compare them to the baseline model.

This detailed analysis will help refine our understanding of how parameter tuning impacts force loss, leading to better performance in future simulations.
