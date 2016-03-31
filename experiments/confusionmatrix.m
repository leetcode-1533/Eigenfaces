load fisheriris
labels = unique(species);
mdl = ClassificationDiscriminant.fit(meas,species);
predicted_species = predict(mdl,meas);
Conf_Mat = confusionmat(species,predicted_species);
disp(Conf_Mat)

Conf_Mat = confusionmat(test_label,predicted_labeln);
heatmap(Conf_Mat, 1:40, 1:40, 1,'Colormap','red','ShowAllTicks',1,'UseLogColorMap',true,'Colorbar',true);