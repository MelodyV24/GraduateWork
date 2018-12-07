import numpy as np
from keras.models import Sequential
from keras.layers import Dense,Dropout,Flatten
from keras.layers import Conv2D, MaxPooling2D
from keras.layers.normalization import BatchNormalization

from sklearn.model_selection import cross_val_score,cross_val_predict
from sklearn import preprocessing
from sklearn.model_selection import train_test_split

data=np.loadtxt('data50.txt')
label=np.loadtxt('label50.txt')

min_max_scaler=preprocessing.MinMaxScaler(feature_range=(-1,1))
data=(min_max_scaler.fit_transform(data.T)).T
data2=data.reshape(-1,8,50)
data2=data2.reshape(-1,8,50,1)

dropout=0.3
neurons=[128,128,16,1]
batch_size=128
epochs=50
nb_filters=64
input_shape=(8,50,1)


x_train,x_test,y_train,y_test=train_test_split(data2,label,test_size=0.2)

model=Sequential()


model.add(Conv2D(nb_filters,(3,11) , strides=(1,1),activation='relu',input_shape=input_shape)) # 卷积层1
model.add(BatchNormalization())
model.add(MaxPooling2D(pool_size=(2,2)))
# =============================================================================
# model.add(Conv2D(16,(4,1) , strides=(4,1),activation='relu')) # 卷积层2
# model.add(BatchNormalization())
# model.add(MaxPooling2D(pool_size=(2,1)))
# =============================================================================

# =============================================================================
# model.add(Conv2D(512,(4,1) , strides=(2,1),activation='relu')) # 卷积层3
# model.add(BatchNormalization())
# model.add(MaxPooling2D(pool_size=(2,1)))
# =============================================================================

model.add(Flatten())
model.add(Dense(256, activation='relu'))
model.add(Dropout(0.3))
model.add(Dense(64, activation='relu'))
model.add(Dropout(0.3))
model.add(Dense(6, activation='softmax'))

model.compile(loss='mse',optimizer='adam',metrics=['accuracy'])
print(model.summary())


h = model.fit(x_train,y_train,epochs=epochs,batch_size=batch_size,validation_data=(x_test,y_test),verbose=1)
