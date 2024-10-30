# Training and Results for J14 Potential

This section presents the training process and results using the **J14 Potential** dataset. The goal is to minimize the **force loss** through training with **NEP4 (Neuroevolution Potential)** to improve the accuracy and efficiency of molecular dynamics (MD) simulations, particularly for predicting thermal conductivity and material behavior.

For detailed input parameter descriptions, refer [here](https://gpumd.org/nep/input_files/nep_in.html#index-0).

---

## Default Parameters and Initial Loss

We first configure the **default parameters** to establish a baseline for the force loss. These parameters control the complexity and representational capacity of the potential model.

### **Default Setup:**
- **`nmax`**: Size of radial and angular basis  
- **`basis_size`**: Number of radial and angular basis functions  
- **`l_max`**: Expansion order for angular terms  
- **`neurons`**: Number of neurons in the hidden layer  
- **`batch`**: Batch size for training  

![Default Setup](./images/default_setup.png)

### **Default Loss:**
The force loss computed using the default setup serves as the benchmark for optimization. 

![Default Loss](./images/default_loss.png)

---

## Phase 1: Minimizing the Loss for Individual Parameters

Our goal is to fine-tune individual parameters systematically to identify optimal configurations for reducing force loss.

### **Approach to Minimizing Loss:**
- **Parameter Tuning:**  
  - Experiment with multiple values for each parameter: `nmax`, `basis_size`, `l_max`, `neurons`, and `batch`.
- **Loss Evaluation Criteria:**  
  - **MIN Strategy:** Use the minimum value from the last 10 rows of the loss output.  
  - **AVG Strategy:** Use the average value from the last 10 rows for comparison.  

- **Objective:**  
  - Identify the parameter values that minimize force loss most effectively.
  - Report the **percentage improvement** over the default configuration for both training and test loss.

---

## Optimized Parameter Configurations and Results

### **1. Optimized Neurons Setup**

We evaluated configurations with different numbers of neurons and found that **60 neurons in a single layer** provided the most significant reduction in loss.

![Neuron Force Loss](./images/neuron_force_loss.png)

- **Configuration:**  
  - 1 Layer, 60 Neurons  

- **Loss Analysis:**  
  - **Train Loss:**  
    - **MIN:** 0.13807 (↓9.03% from 0.15177)  
    - **AVG:** 0.140979 (↓8.70% from 0.154409)  
  - **Test Loss:**  
    - **MIN:** 0.13458 (↓8.68% from 0.14737)  
    - **AVG:** 0.136786 (↓8.48% from 0.149454)  

---

### **2. Optimized Basis Setup**

The **4-8 basis size** offered the best trade-off between accuracy and computational cost.

![Basis Force Loss](./images/basis_force_loss.png)

- **Configuration:**  
  - Basis Size: 4-8  

- **Loss Analysis:**  
  - **Train Loss:**  
    - **MIN:** 0.14226 (↓6.27% from 0.15177)  
    - **AVG:** 0.143862 (↓6.83% from 0.154409)  
  - **Test Loss:**  
    - **MIN:** 0.13759 (↓6.64% from 0.14737)  
    - **AVG:** 0.13915 (↓6.90% from 0.149454)  

---

### **3. Optimized L_max Setup**

We determined that the **4-2-1 configuration for `l_max`** best captured the angular dependencies, yielding consistent improvements.

![Lmax Force Loss](./images/lmax_force_loss.png)

- **Configuration:**  
  - `l_max`: 4-2-1  

- **Loss Analysis:**  
  - **Train Loss:**  
    - **MIN:** 0.14485 (↓4.56% from 0.15177)  
    - **AVG:** 0.148296 (↓3.96% from 0.154409)  
  - **Test Loss:**  
    - **MIN:** 0.14248 (↓3.32% from 0.14737)  
    - **AVG:** 0.144127 (↓3.56% from 0.149454)  

---

### **4. Optimized n_max Setup**

The **2-4 configuration for `n_max`** provided the highest gains, highlighting the importance of precise radial and angular terms.

![Nmax Force Loss](./images/nmax_force_loss.png)

- **Configuration:**  
  - `n_max`: 2-4  

- **Loss Analysis:**  
  - **Train Loss:**  
    - **MIN:** 0.13038 (↓14.09% from 0.15177)  
    - **AVG:** 0.13137 (↓14.92% from 0.154409)  
  - **Test Loss:**  
    - **MIN:** 0.12612 (↓14.42% from 0.14737)  
    - **AVG:** 0.127195 (↓14.89% from 0.149454)  

---

### **5. Optimized Batch Setup**

A **batch size of 2000** ensured smooth convergence and stable training dynamics.

![Batch Force Loss](./images/batch_force_loss.png)

- **Configuration:**  
  - Batch Size: 2000  

- **Loss Analysis:**  
  - **Train Loss:**  
    - **MIN:** 0.14894 (↓1.86% from 0.15177)  
    - **AVG:** 0.15112 (↓2.13% from 0.154409)  
  - **Test Loss:**  
    - **MIN:** 0.14434 (↓2.06% from 0.14737)  
    - **AVG:** 0.14577 (↓2.47% from 0.149454)  

---

## Phase 2: Combining Optimized Parameters

We integrated all optimized parameters to achieve further reductions in force loss.

- **Optimized Parameters:**
  - Neurons: 60 neurons in 1 layer  
  - Basis Size: 4-8  
  - `n_max`: 2-4  
  - `l_max`: 4-2-1  
  - Batch Size: 2000  

- **Loss Analysis:**  
  - **Train Loss:**  
    - **MIN:** 0.12411 (↓18.22% from 0.15177)  
    - **AVG:** 0.124798 (↓19.18% from 0.154409)  
  - **Test Loss:**  
    - **MIN:** 0.11958 (↓18.86% from 0.14737)  
    - **AVG:** 0.120493 (↓19.38% from 0.149454)  

![Optimized Force Setup](./images/force_optimized_setup.png)

### Loss Graphs:
![Force Loss Graph](./images/force_loss_graph.png)

Training beyond **15,000 generations** may be necessary to ensure full convergence.

![Force Comparison Graph](./images/force_loss_aligned.png)

The alignment between the training and test loss shows the model is generalizing well.

### Weight Analysis from `nep.txt`  
![Weight](./images/nep_txt_graph.png)

Most weights contribute meaningfully, confirming the network’s robustness.

---

## Conclusion and Future Work

This optimization effort reduced force loss by up to **19.38%**, with the following insights:

- **Neurons:** Using 60 neurons in a single layer balanced accuracy and computational cost.  
- **Basis Size:** The 4-8 configuration effectively captured essential features without overfitting.  
- **l_max:** The 4-2-1 angular momentum setting was crucial for modeling interactions.  
- **n_max:** The 2-4 basis size yielded the highest improvements, showing the importance of tuning these parameters.  
- **Batch Size:** A batch size of 2000 stabilized training and enhanced convergence.  

### **Next Steps:**
1. **Extend Training:** Increase the number of generations beyond 15,000 to confirm convergence.  
2. **Molecular Dynamics Simulations:** Use the optimized model to simulate thermal conductivity and validate performance gains.  
3. **Compare with Baseline Results:** Evaluate the improvements by comparing MD outputs with the baseline setup.  
4. **Further Tuning:** Explore additional hyperparameters such as learning rate and population size to accelerate convergence.  

This detailed optimization lays a solid foundation for precise force predictions and improved MD simulations, paving the way for deeper insights into the thermal and structural properties of the J14 alloy system.
