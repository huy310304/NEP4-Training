# Training and Results for J14 Potential

This section presents the training process and results using the **J14 Potential** dataset. The objective is to minimize the force loss through training with **NEP4 (Neuroevolution Potential)** to enhance the accuracy and efficiency of molecular dynamics (MD) simulations.

For detailed input parameter descriptions, refer [here](https://gpumd.org/nep/input_files/nep_in.html#index-0).

---

## Default Parameters and Initial Loss

We first configure the default parameters to establish a baseline for the force loss. These parameters govern the complexity and accuracy of the model.

### **Default Setup:**
- **`nmax`**: Size of radial and angular basis  
- **`basis_size`**: Number of radial and angular basis functions  
- **`l_max`**: Expansion order for angular terms  
- **`neurons`**: Number of neurons in the hidden layer  
- **`batch`**: Batch size for training  

![Default Setup](./images/default_setup.png)

### **Default Loss:**
Below is the force loss computed using the default setup, serving as a benchmark for further optimization.

![Default Loss](./images/default_loss.png)

---

## Phase 1: Minimizing the Loss for Individual Parameters

Our primary goal is to minimize the force loss by optimizing the model's parameters individually. 

### **Approach to Minimizing Loss:**
- **Parameter Tuning:**  
  - Experiment with multiple values for each parameter (`nmax`, `basis_size`, `l_max`, `neurons`, `batch`).  
- **Loss Evaluation Criteria:**  
  - **MIN Strategy:** Use the minimum value from the last 10 rows of the loss output.  
  - **AVG Strategy:** Use the average value from the last 10 rows.  
- **Objective:**  
  - Identify optimal values for each parameter.  
  - Report the **mean improvement** and **percentage gain** compared to the default setup.  

---

## Optimized Parameter Configurations and Results

### **1. Optimized Neurons Setup**

We tested various neuron configurations and found that **60 neurons in a single layer** provided the best force loss reduction.

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

The optimal basis size was found to be **4-8**, balancing accuracy and computational efficiency.

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

We found that the **4-2-1 angular momentum configuration (`l_max`)** captured angular interactions most effectively.

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

Testing various **n_max** configurations, the optimal setup was **2-4**, yielding significant gains.

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

We found that a **batch size of 2000** yielded the most stable reduction in force loss.

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

By combining all optimized parameters, we achieved further reductions in force loss.

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

The force loss continues to decrease but has not converged after 15,000 generations, indicating further training is needed.

![Force Comparison Graph](./images/force_loss_aligned.png)

The alignment between the training and test loss demonstrates model consistency.

---

## Conclusion and Future Work

The optimization process has successfully reduced the force loss by up to **19.38%** compared to the default configuration. The following key findings emerged:  

- **Neurons:** 60 neurons in one layer were sufficient for reducing overfitting while maintaining computational efficiency.  
- **Basis Size:** The 4-8 configuration captured a good balance between accuracy and model size.  
- **l_max:** The 4-2-1 configuration effectively modeled angular interactions.  
- **n_max:** The 2-4 setup provided the most significant performance gains, showing that the right choice of basis order improves loss convergence.  
- **Batch Size:** A batch size of 2000 helped ensure smooth convergence without sacrificing stability.  

The combined setup achieved both consistent **train** and **test loss alignment**, demonstrating the robustness of the optimized model.

---

### **Next Steps:**
1. **Continue Training**: Extend the number of generations beyond 15,000 to ensure convergence.  
2. **Run Molecular Dynamics (MD) Simulations**: Use the optimized parameters to evaluate thermal conductivity.  
3. **Compare Results with Baseline**: Assess how well the optimized model performs relative to the default setup in terms of MD results.  
4. **Further Optimization**: Explore other hyperparameters, such as learning rate and population size, to improve convergence speed.  

This thorough optimization process not only ensures better force predictions but also enhances the performance of molecular dynamics simulations, offering a solid foundation for future experiments.