# Updated code to read the file and adjust the header based on the provided information

import pandas as pd
import matplotlib.pyplot as plt

# File path to the loss.out file
file_path = 'loss.out'  # Replace with the actual path

# Load the data assuming it is space-separated and has the structure as described
data = pd.read_csv(file_path, delim_whitespace=True, header=None)

# Assigning meaningful column names based on the description provided
data.columns = ['gen', 'L_t', 'L_1', 'L_2', 'L_e_train', 'L_f_train', 'L_v_train', 'L_e_test', 'L_f_test', 'L_v_test']

# Plotting the total loss and other relevant columns
plt.figure(figsize=(10, 6))
plt.plot(data['gen'], data['L_t'], label='Total Loss (L_t)')
plt.plot(data['gen'], data['L_1'], label='Regularization Loss 1 (L_1)')
plt.plot(data['gen'], data['L_2'], label='Regularization Loss 2 (L_2)')

plt.xlabel('Generation')
plt.ylabel('Loss Values')
plt.title('Loss Functions vs Generation')
plt.legend()
plt.grid(True)
plt.show()

